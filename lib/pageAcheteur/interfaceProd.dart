import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class interfaceProd extends StatefulWidget {
  const interfaceProd({super.key});

  @override
  State<interfaceProd> createState() => _interfaceProdState();
}

class _interfaceProdState extends State<interfaceProd> {
  @override

  int _currentIndex = 0; // Indice de l'image actuellement affichée.
  int currentIndex = 1;

  List<String> titles = ['iPhone 11', 'iPhone 13', 'iPhone 14'];


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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
          children: [
          SizedBox(height: 5,),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: 390,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
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
                      ? Colors.black // Couleur de l'indicateur actif
                      : Colors.grey, // Couleur de l'indicateur inactif
                ),
              );
            }).toList(),
                ),
            SizedBox(height: 15,)
              ]
            ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.grey[300],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 15, left: 20),
                          child: Text(
                            'Iphone 11 128 GB',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.grey[800],
                              fontFamily: "VanillaRavioli_Demo"
                            ),
                          ),
                        ),SizedBox(width: 50,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 14, left: 70),
                          child: Text(
                            '110.000F',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "aAkarRumput",
                                fontWeight: FontWeight.bold,
                                color: Colors.orange
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          Container(
                            width: 110,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
                                SizedBox(width: 15,),
                                Text('0.0',style: TextStyle(fontSize: 21, color: Colors.black,fontWeight: FontWeight.bold,),),
                                SizedBox(width: 5,), 
                                VerticalDivider(
                                 color: Colors.grey[400],   
                                 thickness: 1,          
                               ),
                                SizedBox(width: 0,), 
                                Icon(Icons.star,color: Colors.yellow,size: 32,),
                              ],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 240,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                SizedBox(width: 15,),
                                Text('0',style: TextStyle(fontSize: 21, color: Colors.black,fontWeight: FontWeight.bold,)),
                                SizedBox(width: 5,),
                                Text('Commentaires',style: TextStyle(fontSize: 19, color: Colors.grey[600],)),
                                 VerticalDivider(
                                 color: Colors.grey[400],   
                                 thickness: 1,          
                               ),
                                SizedBox(width: 5,),
                                Icon(Icons.comment,color: Colors.grey[300],size: 32)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 25,  // Longueur horizontale de 25 pixels.
                                height: 3,
                                color: Colors.white,  // Couleur verte pour la ligne.
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "J",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 79),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[900],
                                  ),
                                  child: Row(
                                    children: [
                                      Text('Etat du produit : ', style: TextStyle(color: Colors.grey[300],fontFamily: "VanillaRavioli_Demo",fontSize: 15),),
                                      Text(' Occasion', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                    Text('Description', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Colors.black),),
                    SizedBox(height: 5,),
                    Text("L'iPhone 11 est apprécié pour sa puissante puce A13 Bionic, offrant des performances exceptionnelles, sa configuration à double caméra permettant des captures de qualité, notamment en basse lumière grâce au mode Nuit, son écran Liquid Retina vibrant, son autonomie de batterie solide"
                      ,style: TextStyle(color: Colors.grey),),
                      
                  SizedBox(height: 10,),
                    Center(
                      child: Container(
                          height: 45,
                          width: 375,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange,
                          ),
                          child: const Center(
                            child:  Text('Ajouter au panier',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                              ),
                          ),
                        ),
                    ),
                  SizedBox(height: 15,),
                         ],),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
