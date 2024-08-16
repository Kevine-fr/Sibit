import 'package:firebase_auth/firebase_auth.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:sibit/pageAdmin/homeAdmin.dart';
import 'package:flutter/material.dart';
import 'package:sibit/try.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {

  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState(){
    super.initState();

    Widget _boiteDeDialogue(BuildContext context) {
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


    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Catégorie',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, 
            // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),
      
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Produit',
          colorLineSelected: Colors.blue,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),
      
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Client',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        Try(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),
      
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Avis',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: '',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        HomeAdmin(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Déconnexion',
          colorLineSelected: Colors.white,
          baseStyle: TextStyle(
            fontSize: 18.0, // Changer la taille de la police selon vos besoins
            // fontStyle: FontStyle.italic,
            // fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          selectedStyle: TextStyle(),
        ),
        _boiteDeDialogue(context),
      ),
    ];

  }
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: const Color(0xFF002C49),
      backgroundColorAppBar: const Color(0xFF002C49),
      initPositionSelected: 0,
      isTitleCentered: false,
      styleAutoTittleName: const TextStyle(
        color: Colors.white,
        ),
      leadingAppBar: const Icon(
        Icons.menu,
        color: Colors.white,
        ),
      screens: _pages,
    );
  }
}
