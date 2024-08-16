import 'package:flutter/material.dart';

class Commande extends StatefulWidget {
  const Commande({super.key});

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Succès ',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 20.0,
                fontFamily: 'Times New Roman',
              ),
            ),
            Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
      )
    );
  }
}
