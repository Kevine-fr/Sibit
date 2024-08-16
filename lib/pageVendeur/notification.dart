import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Text('Notification',
              style: TextStyle(
                color: Colors.black
              ),),
              SizedBox(width: 5,),
              Icon(Icons.notifications,
              color: Colors.blue,)
          ]),
        ),
      ),
    );
  }
}