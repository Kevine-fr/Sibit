import
'package:sibit/pageAcheteur/commande.dart';
import 'package:sibit/pageAdmin/hiddenDrawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sibit/pageAcheteur/homePage.dart';
import 'package:sibit/pageAuth/controlAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sibit/pageVendeur/formulaireProd.dart';
import 'package:sibit/pageVendeur/interfaceSell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Utilisateur?>.value(
      value: StreamProviderAuth().utilisateur,
      initialData: null, // Valeur initiale de l'utilisateur (null dans ce cas)
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/': (context) => Passerelle(),
          '/homeAdmin': (context) => HiddenDrawer(), 
          '/homePage': (context) => HomePage(),
        },
        //  home: Commande(),
      ),
    );
  }
}
