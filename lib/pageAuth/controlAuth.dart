import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sibit/pageAcheteur/homePage.dart';
import 'package:sibit/pageAdmin/hiddenDrawer.dart';
import 'package:sibit/pageAuth/chargement.dart';
import 'package:sibit/pageAuth/liaison.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Utilisateur {
  String idUtil;

  Utilisateur({required this.idUtil});
}


class DonneesUtil {
  String email;
  String nomComplet;

  DonneesUtil({required this.email, required this.nomComplet});
}

class StreamProviderAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Création d'objet utilisateur provenant de la classe User
  Utilisateur? _utilisateurDeFirebaseUser(User? user) {
    return user != null ? Utilisateur(idUtil: user.uid) : null;
  }

  //La diffusion de l'auth de l'utilisateur

  Stream<Utilisateur?> get utilisateur {
    return _auth.authStateChanges().map(_utilisateurDeFirebaseUser);
  }
}

class Passerelle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var utilisateur = Provider.of<Utilisateur?>(context);

    if (utilisateur == null) {
      return LiaisonPageAuth();
    } else {
      return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('utilisateurs')
            .doc(utilisateur.idUtil)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Chargement();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else {
            // Accédez aux données de l'utilisateur à partir du snapshot
            var donneesUtil = snapshot.data!.data() as Map<String, dynamic>;
            if (donneesUtil['emailUtil'] == 'kevine@gmail.com' &&
                donneesUtil['nomComplet'] == 'Kevine') {
              return HiddenDrawer();
            } else {
              return HomePage();
            }
          }
        },
      );
    }
  }
}


class GetCurrentUserData {
  String idUtil;
  GetCurrentUserData({required this.idUtil});

  //La référence de la collection utilisateur
  final CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('utilisateurs');
  DonneesUtil _donneesUtilDeSnapshot(DocumentSnapshot snapshot) {
    return DonneesUtil(
      nomComplet: snapshot['nomComplet'],
      email: snapshot['emailUtil'],
    );
  }

  //Obtenir les données d'utilisateur en stream

  Stream<DonneesUtil> get donneesUtil {
    return collectionUtil.doc(idUtil).snapshots().map(_donneesUtilDeSnapshot);
  }
}
