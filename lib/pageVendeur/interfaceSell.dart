import 'package:carousel_slider/carousel_slider.dart';
import 'package:sibit/pageAcheteur/homePage.dart';
import 'package:flutter/material.dart';
import 'package:sibit/pageVendeur/formulaireProd.dart';

class interfaceSell extends StatefulWidget {
  const interfaceSell({super.key});

  @override
  State<interfaceSell> createState() => _interfaceSellState();
}

class _interfaceSellState extends State<interfaceSell> {
  @override

  int _currentIndex = 0; // Indice de l'image actuellement affichée.
  int currentIndex = 1;

  List<String> titles = ['iPhone 11', 'iPhone 13', 'iPhone 14'];
  List<String> stocks = ['In stock' , 'No stock ', 'In stock'];
  List<String> prises = ['110.000','409.99','559.99','759.99'];
  List<String> states = ['Occasion' , 'Neuf ', 'Occasion'];
  List<String> delivarys = ['None' , '02/10/2023', 'None'];
  List<String> notes = ['0.0' , '4.8', '4.4'];
  List<String> votes = ['0' , '44', '25'];


  List<Widget> imageSliders = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset('image/iphone11.jpg', width: 250),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset('image/iphone13.jpg', width: 250),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: Image.asset('image/iphone14.jpg', width: 250),
      ),
    ),
  ];

  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
         items: <BottomNavigationBarItem>[
       BottomNavigationBarItem(
       icon: Container(
         height: 50,
         width: 50,
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(50.0),
             boxShadow: [
         BoxShadow(
         color: Colors.black.withOpacity(0.5),
         blurRadius: 5,
         offset: Offset(2, 2),)
         ],
       ),
       child: IconButton(
         onPressed: (){
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => HomePage()),
           );
         },
         icon: Icon(Icons.list_alt_outlined),
         color: Colors.black,
       ),
     ),
    label: '',
    ),

    BottomNavigationBarItem(
             icon: Container(
               height: 55,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.black
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  IconButton(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormulaireProd()),
                          );
                        },
                      icon: Row(
                        children: [
                          Icon(
                            Icons.shopify_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Vendre',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                 ],
               ),
             ),
             label: '',
           ),
           BottomNavigationBarItem(
             icon: Container(
               height: 50,
               width: 50,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(50.0),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.5),
                     blurRadius: 5,
                     offset: Offset(2, 2),)
                 ],
               ),
               child: Icon(
                 Icons.notifications_active_rounded,
                 color: Colors.black,
               ),
             ),
             label: '',
           ),
         ],
         selectedFontSize: 16.0, // Taille de police pour l'icône sélectionnée (Accueil et Paramètres).
         onTap: (index) {
           setState(() {
             currentIndex = index;
           });
         },
       ),

       body: Column(
         children: [
           SizedBox(height: 30,),
           CarouselSlider(
             items: imageSliders,
             options: CarouselOptions(
               height: 430,
               enlargeCenterPage: true,
               autoPlay: true,
               autoPlayInterval: Duration(seconds: 2),
               autoPlayAnimationDuration: Duration(milliseconds: 800),
               autoPlayCurve: Curves.fastOutSlowIn,
               onPageChanged: (index, reason) {
                 setState(() {
                   _currentIndex = index;
                 });
               },
             ),
           ),
           SizedBox(height: 0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: imageSliders.asMap().entries.map((entry) {
               return Container(
                 width: 9.0,
                 height: 9.0,
                 margin: EdgeInsets.symmetric(horizontal: 2.0),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: _currentIndex == entry.key
                       ? Colors.white // Couleur de l'indicateur actif
                       : Colors.white, // Couleur de l'indicateur inactif
                 ),
               );
             }).toList(),
           ),
           SizedBox(height: 5,),

           Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Text(
                       'Online',
                       style: TextStyle(
                           color: Colors.grey,
                           fontSize: 12
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 25),
                     child: Text(
                       titles[_currentIndex],
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 22,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: [
                   SizedBox(width: 5, height: 5),
                   Container(
                     width: 180,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                     color: Colors.grey[900],),
                     child: Column(
                       children: [
                         SizedBox(height: 20),
                         Row(
                           children: [
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 30),
                               height: 30,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 10),
                               height: 50,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 5),
                               height: 55,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 15),
                               height: 45,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 25),
                               height: 35,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),
                             SizedBox(width: 10),
                             Container(
                               margin: EdgeInsets.only(top: 40),
                               height: 25,
                               width: 8,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: Colors.green
                               ),
                             ),SizedBox(width: 20),
                             Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(50.0),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black.withOpacity(0.5),
                                     blurRadius: 5,
                                     offset: Offset(2, 2),)
                                 ],
                               ),
                               child: Icon(
                                 Icons.call_made,
                                 color: Colors.black,
                               ),
                             ),
                           ],
                         ),SizedBox(height: 20),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                            SizedBox(width: 5,),
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(25),
                                 color: Colors.white,
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black.withOpacity(0.5),
                                     blurRadius: 5,
                                     offset: Offset(2, 2),)
                                 ],
                               ),
                               child: Row(
                                 children: [
                                   Text(
                                     prises[_currentIndex],
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 22,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: 'VanillaRavioli_Demo'
                                     ),
                                   ),SizedBox(width: 2.5,),
                                   Text('F',style: TextStyle(
                                     color: Colors.green,
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'VanillaRavioli_Demo'

                                     ),
                                   )
                                 ],
                               ),
                             ),
                           ],
                         ),SizedBox(height: 5,),
                         Row(
                           children: [
                             Container(
                               margin: EdgeInsets.symmetric(horizontal: 5),
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(50.0),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black.withOpacity(0.5),
                                     blurRadius: 5,
                                     offset: Offset(2, 2),)
                                 ],
                               ),
                               child: Icon(
                                 Icons.offline_bolt,
                                 color: Colors.black,
                               ),
                             ),
                             Container(
                               padding: EdgeInsets.only(
                                 right: states[_currentIndex] == 'Occasion' ? 28 : 55,
                                 left: 2,
                               ),
                               child: Text(
                                 states[_currentIndex],
                                 style: TextStyle(
                                   color: states[_currentIndex] == 'Occasion' ? Colors.white : Colors.green,
                                   fontSize: 15,
                                 ),
                               ),
                             ),
                             SizedBox(width: 5),
                             Container(
                               height: 39,
                               width: 40,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(15),
                                   bottomLeft: Radius.circular(35),
                                   topRight: Radius.circular(35),
                                   topLeft: Radius.circular(35),
                                 ),
                                 color: Colors.white,
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                   ),SizedBox(width: 10),
                   Container(
                     height: 200,
                     width: 210,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.grey[200],
                     ),
                     child: Column(
                       children: [
                         Container(
                           height: 125,
                           width: 210,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.transparent,
                          ),
                           child: Column(
                             children: [
                               Container(
                                 padding: EdgeInsets.only(
                                     left: 20,
                                     top: 20,
                                   bottom: 5,
                                 ),
                                 child: Row(
                                   children: [
                                     Icon(
                                       Icons.filter_list,
                                     color: stocks[_currentIndex] == 'In stock' ? Colors.green : Colors.red,
                                       size: 30,
                                     ),
                                     SizedBox(width: 10),
                                     Text(
                                       stocks[_currentIndex],
                                     style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 16,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Divider(  // Utilisation du widget Divider pour la ligne horizontale.
                                 color: Colors.grey[400],  // Couleur de la ligne (optionnelle).
                                 indent: 20,  // Marge à gauche (optionnelle).
                                 endIndent: 20,  // Marge à droite (optionnelle).
                               ),
                               Container(
                                 padding: EdgeInsets.only(
                                     left: 20,
                                     top: 10),
                                 child: Row(
                                   children: [
                                     Icon(
                                         Icons.shopping_cart,
                                         size: 30,
                                       color: Colors.blue,
                                     ),SizedBox(width: 5),
                                     Text(
                                       'Delivary : ',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                     Text(
                                       delivarys[_currentIndex],
                                     ),
                                   ],
                                 ),
                               )
                             ],
                           ),
                         ), Divider(  // Utilisation du widget Divider pour la ligne horizontale.
                           color: Colors.white,  // Couleur de la ligne (optionnelle).
                           thickness: 2,  // Épaisseur de la ligne (optionnelle).
                           indent: 0,  // Marge à gauche (optionnelle).
                           endIndent: 0,  // Marge à droite (optionnelle).
                         ),
                         Container(
                           padding: EdgeInsets.only(
                               left: 20,
                               top: 8),
                           height: 45,
                           width: 210,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15),
                             color: Colors.transparent,
                           ),
                           child: Row(
                             children: [
                               Icon(
                                   Icons.star,
                                   size: 30,
                                 color: Colors.yellow,
                               ),SizedBox(width: 10),
                               Text(
                                 notes[_currentIndex],
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18
                                 ),
                               ), SizedBox(width: 5),
                               VerticalDivider(
                                 color: Colors.grey[400],   // Couleur du diviseur (optionnelle).
                                 thickness: 1,          // Épaisseur du diviseur (optionnelle).
                               ),
                               Text(
                                 votes[_currentIndex],
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold
                                 ),
                               ),
                               Text(
                                 '  Reviews',
                               style: TextStyle(
                                 color: Colors.grey[600]
                               ),)
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               )
             ],
           ),
         ],
       ),
     );
  }
}
