import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  Try({super.key});

  
  final CollectionReference collectionClient =
      FirebaseFirestore.instance.collection('utilisateurs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Try this')),
      body: FutureBuilder<QuerySnapshot>(
                // Récupérer les données depuis Firebase
                future: collectionClient.doc('MO7HJ0iYlAfp6GUlbpCJpyCetEo2').collection('client').get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } if (snapshot.hasError) {
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
    );
  }
}