import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sibit/pageAuth/controlAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'dart:ffi';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  late String nomUtil, emailUtil, nomCat, descriptionCat, idCat;
  late int heure, minutes;

  final _formKey = GlobalKey<FormState>();

  final CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('utilisateurs');

  late User currentUser;

  Widget _action(DocumentSnapshot document) {
    return Container();
  }

  Widget _boiteDeDialogue(BuildContext, String nom, String email) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                'Déconnexion',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Êtes-vous sûr(e) de vouloir vous déconnecter',
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Center(
                child: Text(' $nom ?'),
              ),
              //Text('$email', style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: 25),
              Wrap(
                spacing: 10, // Espacement horizontal entre les boutons
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      FirebaseAuth _auth = FirebaseAuth.instance;
                      await _auth.signOut();
                      Navigator.pop(context);
                    },
                    child: Text('Oui'),
                  ),

                  SizedBox(width: 5), // Espace de 10 points entre les boutons

                  ElevatedButton(
                    onPressed: () {
                      // Ajoutez l'action que vous souhaitez effectuer ici
                      print('Bouton Annuler a été appuyé.');
                      Navigator.pop(context);
                    },
                    child: Text('Non'),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        currentUser = user!;
      });
    });

    String idUtil() {
      if (currentUser != null) {
        return currentUser!.uid;
      } else {
        return "Pas d'id";
      }
    }

    Future<void> supprimerCategorie(String idUtil, String idCategorie) async {
      await FirebaseFirestore.instance
          // .collection('utilisateurs')
          // .doc(idUtil)
          .collection('categories')
          .doc(idCategorie)
          .delete();
    }

    final utilisateur = Provider.of<Utilisateur?>(context);
    if (utilisateur != null) {
      // Vérification que utilisateur n'est pas nul
      GetCurrentUserData(idUtil: utilisateur.idUtil)
          .donneesUtil
          .forEach((snapshot) {
        this.nomUtil = snapshot.nomComplet;
        this.emailUtil = snapshot.email;
      });
    }

    void _afficherPopupInfo(BuildContext context, String id) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10), // Espacement à gauche et à droite
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Action sur la catégorie',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Quelle action voulez-vous effectuer sur cette catégorie ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Espacement symétrique
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 5, right: 10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Détails',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Modifier',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        idCat = id;
                        await supprimerCategorie(utilisateur!.idUtil,
                            idCat); // document.id est l'ID de la catégorie à supprimer
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(width: 3),
                          Text(
                            'Supprimer',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          );
        },
      );
    }

    Widget _categories(DocumentSnapshot document) {
       String formattedDate = document['date'].toString();
        int heure = document['heure'];
        int minutes = document['minutes'];

      return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: EdgeInsets.only(
            top: 5,
            left: 15,
            bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // affichageImage(),
                  Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 18,
                                ),
                                // Text('${heure.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}',
                                // style: TextStyle(color: Colors.white),),
                                Text(
                                  '$formattedDate',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              // Utilisation du widget Divider pour la ligne horizontale.
                              color: Colors.grey, // Couleur de la ligne (optionnelle).
                              indent: 15, // Marge à gauche (optionnelle).
                              endIndent: 10, // Marge à droite (optionnelle).
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                              padding: EdgeInsets.only(
                                top: 6,
                                left: 5,
                                bottom: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${document['nomCat']} ',
                                    style: TextStyle(
                                        color: Color(0xFF002C49),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                              Text(
                                '${document['descriptionCat']}',
                                style: TextStyle(color: Colors.grey[600],
                                  fontSize: 13,),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 95,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF002C49)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        _afficherPopupInfo(
                                            context, document.id);
                                      },
                                      child: Text(
                                        'Action',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'VanillaRavioli_Demo'),
                                        )
                                      ),
                                  IconButton(
                                      onPressed: () {
                                        _afficherPopupInfo(
                                            context, document.id);
                                      },
                                      icon: Icon(
                                        Icons.layers,
                                        color: Colors.blue,
                                      )
                                    )
                                ],
                              ),
                            ),
                            ],)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: TabBarView(
          children: [
            // Contenu de l'onglet 'Catégorie'
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  // .collection('utilisateurs')
                  // .doc(utilisateur?.idUtil)
                  .collection('categories')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      "Appuyez sur le bouton + pour ajouter une catégorie",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF002C49),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) =>
                                _boiteDeDialogue(context, nomUtil, emailUtil)),
                        child: Text('L O G O U T',
                            style: TextStyle(color: const Color.fromARGB(255, 135, 113, 113)))),
                              Text('Information à savoir :',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("Attention car toutes actions à effectuer dans cette page est executée simultannement et est irréversible, ainsi veuillez bien être sur de votre action avant execution. La suppression d'une catégorie implique la suppression de tout produits mise en ligne dans la catégorie correspondante (Cette action est irréversible).",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13),)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Liste des Catégories de ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[900]),
                            ),
                            Text(
                              ' Sell Me Buy Me',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'aAkarRumput',
                                  color: Colors.orange),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) =>
                                _categories(snapshot.data!.docs[index]),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),

            // Contenu de l'onglet 'Produits'
            Center(child: Text("Aucun Produit n'a été mise en vente")),

            // Contenu de l'onglet 'Compte client'
            Container(
              child: FutureBuilder<QuerySnapshot>(
                // Récupérer les données depuis Firebase
                future: collectionUtil
                    .doc('MO7HJ0iYlAfp6GUlbpCJpyCetEo2')
                    .collection('client')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Erreur : ${snapshot.error}'));
                  } else {
                    // Afficher les données dans une ListView
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return ListTile(
                          title: Text('Nom: ${data['nomComplet']}'),
                          subtitle: Text('E-mail: ${data['emailUtil']}'),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),

            // Contenu de l'onglet 'Avis'
            Center(child: Text('Aucun Avis')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
  backgroundColor: Color(0xFF002C49),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Ajouter une catégorie')),
          contentPadding: EdgeInsets.all(20),
          actions: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom de la catégorie',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom de catégorie';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        nomCat = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description de la catégorie',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer une description de catégorie';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        descriptionCat = value;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Obtenir la date et l'heure actuelles
                        DateTime maintenant = DateTime.now();
                        int heure = maintenant.hour;
                        int minutes = maintenant.minute;

                        await FirebaseFirestore.instance
                            .collection('categories')
                            .add({
                          'nomCat': nomCat,
                          'descriptionCat': descriptionCat,
                          'date': DateFormat('dd/MM/yyyy').format(maintenant),
                          'heure': heure,
                          'minutes': minutes,
                        });

                        this.setState(() {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text('Valider'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      print('Bouton Annuler a été appuyé.');
                      Navigator.pop(context);
                    },
                    child: Text('Annuler'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  },
  child: const Icon(
    Icons.add,
    color: Colors.white,
  ),
),

      ),
    );
  }
}
