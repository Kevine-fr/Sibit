import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sibit/pageAcheteur/interfaceProd.dart';
import 'package:sibit/pageAcheteur/panier.dart';
import 'package:sibit/pageVendeur/interfaceSell.dart';
import 'package:sibit/pageAuth/controlAuth.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

bool isDarkMode = false;

class _MyDrawerState extends State<MyDrawer> {
  late String nomUtil, emailUtil;

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

  Widget build(BuildContext context) {
    final utilisateur = Provider.of<Utilisateur>(context);

    GetCurrentUserData(idUtil: utilisateur.idUtil)
        .donneesUtil
        .forEach((snapshot) {
      nomUtil = snapshot.nomComplet;
      emailUtil = snapshot.email;
    });

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(Icons.person, color: Colors.black, size: 85)),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 35), // Espacement entre l'icône et le texte
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, size: 30, color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => interfaceSell()),
                          );
                        },
                        child: Text('F A V O R I S',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(Icons.info, size: 30, color: Colors.white),
                    SizedBox(width: 10), // Espacement entre l'icône et le texte
                    Text('A  P R O P O S', style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Icon(Icons.dark_mode, size: 30, color: Colors.white),
                    SizedBox(width: 10),
                    Text('M O D E', style: TextStyle(color: Colors.white)),
                    Spacer(), // Ajout d'un espaceur flexible pour aligner le Switch à droite
                    Switch(
                      value: isDarkMode,
                      onChanged: (newValue) {
                        // Gérer le changement d'état du mode sombre ici
                        // Par exemple, vous pouvez utiliser un setState pour mettre à jour la variable isDarkMode
                        setState(() {
                          isDarkMode = newValue;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(Icons.notifications, size: 30, color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Panier()),
                          );
                        },
                        child: Text('P A R L E R',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 30, color: Colors.white),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => interfaceSell()),
                          );
                        },
                        child: Text('V E N D R E',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
                const SizedBox(
                  height: 105,
                ),
                Row(
                  children: [
                    Icon(Icons.logout, size: 30, color: Colors.white),
                    SizedBox(width: 10), // Espacement entre l'icône et le texte
                    TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) =>
                                _boiteDeDialogue(context, nomUtil, emailUtil)),
                        child: Text('D E C O N N E X I O N',
                            style: TextStyle(color: const Color.fromARGB(255, 135, 113, 113)))),
                  ],
                ),//{Beug ici}
              ],
            ),
          ),
        ],
      ),
    );
  }
}
