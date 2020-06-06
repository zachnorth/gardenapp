import 'package:flutter/material.dart';
import 'package:gardenapp/services/auth.dart';

class StartPlanting extends StatefulWidget {
  @override
  _StartPlantingState createState() => _StartPlantingState();
}

class _StartPlantingState extends State<StartPlanting> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(backgroundColor: Colors.lightGreen[300],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.do_not_disturb),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Page for getting started with planting')
          ],
        ),
      ),
    );
  }
}
