import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sibit/pageAcheteur/commande.dart';
import 'package:sibit/pageAuth/controlAuth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Panier extends StatefulWidget {
  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  late String nomUtil, emailUtil, nomCat, descriptionCat;
  final _formKey = GlobalKey<FormState>();

  final CollectionReference collectionUtil =
      FirebaseFirestore.instance.collection('utilisateurs');

  late User currentUser;

  Widget _boiteDeDialogue(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                'Vider votre panier',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    'Êtes-vous sûr(e) de vouloir vider les articles de ',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),Text(
                'Ludger de votre panier ? ',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
                ],
              ),
              //Text('$email', style: Theme.of(context).textTheme.subtitle2),  
              SizedBox(height: 25),
              Wrap(
                spacing: 10, // Espacement horizontal entre les boutons
                children: [
                  ElevatedButton(
                    onPressed: () async {},
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

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mon panier',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontFamily: 'VanillaRavioli_Demo',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.shopping_basket,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[900],
                  ),
                  child: Center(
                    child: Text(
                      'J',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ludger',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Utilisez TextOverflow.ellipsis pour tronquer le texte s'il est trop long
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: IconButton(
                            onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return _boiteDeDialogue(context);
                              },
                            );
                          },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 125,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Image.asset(
                        'image/iphone11.jpg',
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            'iPHONE 11',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'VanillaRavioli_Demo',
                            ),
                            maxLines:
                                3, // Définissez le nombre maximum de lignes
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          child: Text(
                            'Etat du produit : Occasion',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'VanillaRavioli_Demo',
                            ),
                            maxLines:
                                3, // Définissez le nombre maximum de lignes
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '110.000F',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'VanillaRavioli_Demo'),
                            ),
                            Container(
                              height: 55,
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300]),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.orange),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 5,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 5,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     color: Colors.white,
            //   ),
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.symmetric(horizontal: 10),
            //         width: 125,
            //         height: 150,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Center(
            //           child: Image.asset(
            //             'image/iphone13.jpg',
            //             width: 100,
            //           ),
            //         ),
            //       ),
            //       SizedBox(width: 15),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               height: 15,
            //             ),
            //             Container(
            //               child: Text(
            //                 'iPHONE 13',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 18,
            //                   fontFamily: 'VanillaRavioli_Demo',
            //                 ),
            //                 maxLines:
            //                     3, // Définissez le nombre maximum de lignes
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             Container(
            //               child: Text(
            //                 'Etat du produit : Occasion',
            //                 style: TextStyle(
            //                   color: Colors.grey,
            //                   fontSize: 15,
            //                   fontFamily: 'VanillaRavioli_Demo',
            //                 ),
            //                 maxLines:
            //                     3, // Définissez le nombre maximum de lignes
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             SizedBox(height: 25),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   '639.99 €',
            //                   style: TextStyle(
            //                       color: Colors.orange,
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.bold,
            //                       fontFamily: 'VanillaRavioli_Demo'),
            //                 ),
            //                 Container(
            //                   height: 55,
            //                   width: 130,
            //                   padding: EdgeInsets.symmetric(
            //                       horizontal: 5, vertical: 5),
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(20),
            //                       color: Colors.grey[300]),
            //                   child: Row(
            //                     children: [
            //                       Container(
            //                         width: 50,
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(20),
            //                             color: Colors.white),
            //                         child: IconButton(
            //                           onPressed: () {},
            //                           icon: Icon(
            //                             Icons.remove,
            //                             color: Colors.orange,
            //                           ),
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 5,
            //                       ),
            //                       Text(
            //                         '1',
            //                         style: TextStyle(
            //                             fontSize: 12, color: Colors.black),
            //                       ),
            //                       SizedBox(
            //                         width: 5,
            //                       ),
            //                       Container(
            //                         width: 50,
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(20),
            //                             color: Colors.orange),
            //                         child: Center(
            //                           child: IconButton(
            //                             onPressed: () {},
            //                             icon: Icon(
            //                               Icons.add,
            //                               color: Colors.white,
            //                             ),
            //                           ),
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 191,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Détails commande', 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('iPhone 11',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                      ),),
                      
                      Text('110.000F',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),)
                    ],
                  ),
            // SizedBox(height: 5,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('iPhone 13',
            //           style: TextStyle(
            //             color: Colors.grey,
            //             fontSize: 13,
            //             fontWeight: FontWeight.w500
            //           ),),
                      
            //           Text('639.99 €',
            //           style: TextStyle(
            //             color: Colors.grey,
            //             fontSize: 13,
            //           ),)
            //         ],
            //       ),
            SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Livraison',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                      ),),
                      
                      Text('3500F',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),)
                    ],
                  )
                ]),
            ),
            SizedBox(height: 14,),
            Container(
              height: 80,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '113.500F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'VanillaRavioli_Demo'),
                      ),
                    ],
                  ),
                  // Row pour le bouton "Commander"
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Ajoutez ici le code pour le traitement de la commande
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Commande()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Changez la couleur ici
                        ),
                        child: Text(
                          'Commander',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
