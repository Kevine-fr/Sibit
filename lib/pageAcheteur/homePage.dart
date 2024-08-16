import 'package:flutter/material.dart';
import 'package:sibit/pageAcheteur/interfaceProd.dart';
import 'package:sibit/pageAcheteur/panier.dart';
import 'drawer.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ajoutez un controller pour le TextField
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    // Annulez le controller du TextField dans dispose
    searchController.dispose();
    super.dispose();
  }

  final category = [
    {'color': Colors.white, 'title': 'Micros'},
    {'color': Colors.orange,'title': 'Laptop'},
    {'color': Colors.white, 'title': 'NVIDIA'},
    {'color': Colors.white, 'title': 'Techno'},
    {'color': Colors.white, 'title': 'iPhone'},
    {'color': Colors.white, 'title': 'Airpod'}
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                child: Text(
                  ' Sell Me Buy Me ',
                  style: TextStyle(
                    fontFamily: 'aAkarRumput',
                    color: Colors.orange,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Panier()),
                );
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5),
                color: Colors.black,
                height: 125,
                child: Container(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        height: 50,
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.only(
                              bottom: 1.0, right: 10, left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: TextField(
                            controller: searchController, // Utilisez le controller
                            style: TextStyle(
                                color: Colors.black, fontStyle: FontStyle.normal),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.search, color: Colors.black),
                              suffixIcon:
                                  Icon(Icons.filter_list, color: Colors.black),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        height: 35,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) => Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: category[index]['color'] as Color,
                                  ),
                                  height: 20,
                                  child: Text(
                                    category[index]['title'] as String,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'VanillaRavioli_Demo',
                                    ),
                                  ),
                                )),
                            separatorBuilder: ((context, index) =>
                                SizedBox(width: 8)),
                            itemCount: category.length),
                      )
                    ],
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 3),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       topRight: Radius.circular(20),
              //     ),
              //     color: Colors.white12,
              //   ),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              //     child: Column(
              //       children: [
              //         Container(
              //           width: 400,
              //           height: 150,
              //           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               bottomRight: Radius.circular(15),
              //               topRight: Radius.circular(0),
              //             ),
              //             color: Colors.grey[900],
              //           ),
              //           child: Row(
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.only(right: 20),
              //                 width: 130,
              //                 height: 150,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.only(
              //                     bottomRight: Radius.circular(15),
              //                     topRight: Radius.circular(10),
              //                   ),
              //                 ),
              //                 child: Image.asset(
              //                   'image/iphone11.jpg',
              //                   width: 100,
              //                 ),
              //               ),
              //               SizedBox(width: 5,),
              //               Container(
              //                 height: 150,
              //                 width: 255,
              //                 decoration: BoxDecoration(
              //                     color: Colors.white12,
              //                     borderRadius: BorderRadius.only(
              //                         topRight: Radius.circular(5),
              //                         bottomRight: Radius.circular(15)
              //                     )
              //                 ),
              //                 child: Column(
              //                     children: [
              //                       Row(
              //                         children: [
              //                           SizedBox(width: 5,),
              //                           Container(
              //                             padding: EdgeInsets.only(left: 5),
              //                             height: 35,
              //                             width: 250,
              //                             child: Row(
              //                               children: [
              //                                 Container(
              //                                   width: 200,
              //                                   child: Text(
              //                                     'Iphone 11',
              //                                     style: TextStyle(
              //                                       color: Colors.white,
              //                                       fontSize: 22,
              //                                       fontWeight: FontWeight.bold,
              //                                       fontFamily: 'VanillaRavioli_Demo',
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 SizedBox(width: 8),
              //                                 Container(
              //                                   height: 35,
              //                                   width: 35,
              //                                   decoration: BoxDecoration(
              //                                     borderRadius: BorderRadius.circular(40),
              //                                     color: Colors.black,
              //                                   ),
              //                                   child: IconButton(onPressed: (){},
              //                                       icon: Icon(
              //                                         Icons.favorite,
              //                                         color: Colors.white,
              //                                         size: 20,
              //                                       )
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       SizedBox(height: 5,),
              //                       Row(
              //                         children: [
              //                           Container(
              //                             height: 45,
              //                             width: 255,
              //                             padding:EdgeInsets.only(left: 10 ,
              //                                                                       right: 5),
              //                             child: Text(
              //                               'Iphone 11 Noir 128 GB avec IOS 17 '
              //                                   '+ chargeur offert + capacité whaterp...',
              //                               style: TextStyle(
              //                                   color: Colors.white
              //                               ),
              //                             ),
              //                           )
              //                         ],
              //                       ),
              //                       SizedBox(height: 10,),
              //                       Row(
              //                         children: [
              //                           SizedBox(width: 10,),
              //                           Container(
              //                             decoration: BoxDecoration(
              //                               borderRadius: BorderRadius.circular(15),
              //                               color: Colors.black,
              //                             ),
              //                             width: 95,
              //                             height: 40,
              //                             child: TextButton(
              //                               onPressed: (){
              //                                 Navigator.push(
              //                                   context,
              //                                   MaterialPageRoute(
              //                                       builder: (context) => interfaceProd()),
              //                                 );
              //                               },
              //                               child: Text('339.99 €',
              //                                 style: TextStyle(
              //                                   color: Colors.orange,
              //                                   fontSize: 15,
              //                                   fontWeight: FontWeight.bold,
              //                                 ),
              //                               ),
              //                             ),
              //                           ),
              //                           SizedBox(width: 75,),
              //                           Container(
              //                             child: Text(
              //                               'Occasion',
              //                               style: TextStyle(
              //                                 fontWeight: FontWeight.bold,
              //                                 color: Colors.blue,
              //                               ),
              //                             ),
              //                           )
              //                         ],
              //                       )
              //                     ]
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 8,),
              //         // Ajoutez le reste de votre contenu ici
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'image/pctrois.jpg',
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 150,
                              width: 255,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(15)
                                  )
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 35,
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  'ASUS ROG Flow X16 GV601RW-M6006W',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'VanillaRavioli_Demo',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(40),
                                                  color: Colors.black,
                                                ),
                                                child: IconButton(onPressed: (){},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 255,
                                          padding:EdgeInsets.only(left: 10 ,
                                                                                    right: 5),
                                          child: Text(
                                            'Gamer, 16", IPS, WQHD+, 16:10, 165 Hz, Tactile, Ryzen 9 6900HS, RTX 3070 Ti Max-Q, RAM 16 Go, SSD 1 To, Windows 11, 1,30 kg',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                          width: 95,
                                          height: 40,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => interfaceProd()),
                                              );
                                            },
                                            child: Text('725.000F',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75,),
                                        Container(
                                          child: Text(
                                            'Occasion',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      // Ajoutez le reste de votre contenu ici
                    ],
                  ),
                ),
              ),
              //Espace
              
              Container(
                padding: EdgeInsets.only(top: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'image/pcquatre.jpg',
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 150,
                              width: 255,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(15)
                                  )
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 35,
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  'COMPARER ASUS TUF Gaming A15 TUF507XI-HQ007W',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'VanillaRavioli_Demo',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(40),
                                                  color: Colors.black,
                                                ),
                                                child: IconButton(onPressed: (){},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 255,
                                          padding:EdgeInsets.only(left: 10 ,right: 5),
                                          child: Text(
                                            'Gamer, 15.6", IPS, WQHD, 165 Hz, Ryzen 9 7940HS, RTX 4070, RAM 16 Go, SSD 1 To, Windows 11, 2,20 kg',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                          width: 95,
                                          height: 40,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => interfaceProd()),
                                              );
                                            },
                                            child: Text('985.000F',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75,),
                                        Container(
                                          child: Text(
                                            'Neuf',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      // Ajoutez le reste de votre contenu ici
                    ],
                  ),
                ),
              ),
              //espace
              
              Container(
                padding: EdgeInsets.only(top: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'image/pccinq.jpg',
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 150,
                              width: 255,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(15)
                                  )
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 35,
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  'MSI Katana 15 B12VGK-208FR',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'VanillaRavioli_Demo',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(40),
                                                  color: Colors.black,
                                                ),
                                                child: IconButton(onPressed: (){},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 255,
                                          padding:EdgeInsets.only(left: 10 ,
                                                                                    right: 5),
                                          child: Text(
                                            'Gamer, 15.6", IPS, Full HD, 144 Hz, Core i7-12650H, RTX 4070, RAM 16 Go, SSD 512 Go, Windows 11, 2,25 kg',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                          width: 95,
                                          height: 40,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => interfaceProd()),
                                              );
                                            },
                                            child: Text('875.000F',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75,),
                                        Container(
                                          child: Text(
                                            'Occasion',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      // Ajoutez le reste de votre contenu ici
                    ],
                  ),
                ),
              ),
              //espace
              
              Container(
                padding: EdgeInsets.only(top: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'image/pcun.jpg',
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 150,
                              width: 255,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(15)
                                  )
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 35,
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  'ASUS ROG STRIX 17 G713PI-LL047W',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'VanillaRavioli_Demo',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(40),
                                                  color: Colors.black,
                                                ),
                                                child: IconButton(onPressed: (){},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 255,
                                          padding:EdgeInsets.only(left: 10 ,
                                                                                    right: 5),
                                          child: Text(
                                            'Gamer, 17", IPS, QHD, 240 Hz, Ryzen 9 7845HX, RTX 4070, RAM 16 Go, SSD 1 To, Windows 11, 2,80 kg',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                          width: 95,
                                          height: 40,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => interfaceProd()),
                                              );
                                            },
                                            child: Text('999.000F',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75,),
                                        Container(
                                          child: Text(
                                            'Occasion',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      // Ajoutez le reste de votre contenu ici
                    ],
                  ),
                ),
              ),
              //espace
              
              Container(
                padding: EdgeInsets.only(top: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white12,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 150,
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(0),
                          ),
                          color: Colors.grey[900],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20),
                              width: 130,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'image/pcdeux.jpg',
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 150,
                              width: 255,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(15)
                                  )
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 35,
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  'Iphone 11',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'VanillaRavioli_Demo',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(40),
                                                  color: Colors.black,
                                                ),
                                                child: IconButton(onPressed: (){},
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 255,
                                          padding:EdgeInsets.only(left: 10 ,
                                                                                    right: 5),
                                          child: Text(
                                            'Iphone 11 Noir 128 GB avec IOS 17 '
                                                '+ chargeur offert + capacité whater p...',
                                            style: TextStyle(
                                                color: Colors.white
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black,
                                          ),
                                          width: 95,
                                          height: 40,
                                          child: TextButton(
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => interfaceProd()),
                                              );
                                            },
                                            child: Text('750.000F',
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75,),
                                        Container(
                                          child: Text(
                                            'Occasion',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      // Ajoutez le reste de votre contenu ici
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Changez la couleur du tiroir en rouge (red)
          child: MyDrawer(),
        ),
      ),
    );
  }
}

