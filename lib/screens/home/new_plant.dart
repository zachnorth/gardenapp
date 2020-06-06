import 'package:flutter/material.dart';
import 'package:gardenapp/services/auth.dart';
import 'package:gardenapp/shared/constants.dart';
import 'package:gardenapp/services/database.dart';

class NewPlant extends StatefulWidget {
  @override
  _NewPlantState createState() => _NewPlantState();
}

class _NewPlantState extends State<NewPlant> {

  final AuthService _auth = AuthService();

  String plantName = '';
  String plantDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[300],
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
        body: Column(
          children: <Widget>[
            Text('Please enter a name and a description'),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => plantName = val),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter a description' : null,
              onChanged: (val) => setState(() => plantDescription = val),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await DatabaseService(uid: plantName).addNewPlantData(plantName, plantDescription).then(Navigator.of(context).pop);
              },
            )
          ],
        )
    );
  }
}
