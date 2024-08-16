import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
                                'image/pcdeux.jpg',
                                width: 100,
                              ),
    );
  }
}