import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chargement extends StatefulWidget {
  const Chargement({super.key});

  @override
  State<Chargement> createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              // child: Icon(Icons.apple, size: 95,color: Colors.white,)
            ),
            const SizedBox(height: 150),
            const SpinKitCircle(
              color: Colors.black,
              size: 90,
            ),
            SizedBox(height: 250,),
            Text('Bienvenue à SMBM !',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
