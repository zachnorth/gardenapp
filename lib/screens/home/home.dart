import 'package:flutter/material.dart';
import 'package:gardenapp/screens/authenticate/sign_in.dart';
import 'package:gardenapp/screens/home/new_plant.dart';
import 'package:gardenapp/screens/home/start_planting.dart';
import 'package:gardenapp/services/auth.dart';
import 'package:gardenapp/services/database.dart';
import 'package:gardenapp/shared/constants.dart';
import 'package:gardenapp/screens/home/journal.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      body: Center(
        child: Column(
          children: <Widget>[
            Text('   Garden Home Page   ', style: TextStyle(color: Colors.black, fontSize: 30.0, decoration: TextDecoration.underline)),
            SizedBox(height: 40.0),
            MaterialButton(
              height: 38.0,
              minWidth: 120,
              color: Colors.green,
              child: Text('New Plant', style: TextStyle(color: Colors.white)),
              onPressed: () => _wrapperNewPlant(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[500])
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              height: 38.0,
              minWidth: 120,
              color: Colors.green,
              child: Text('Start Planting', style: TextStyle(color: Colors.white)),
              onPressed: () => _wrapperStartPlanting(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[500])
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              height: 38.0,
              minWidth: 120,
              color: Colors.green,
              child: Text('Journal', style: TextStyle(color: Colors.white)),
              onPressed: () => _wrapperJournal(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[500])
              ),
            ),


          ],
        ),
      ),
    );
  }

  void _wrapperNewPlant(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return NewPlant();
            }
        )
    );
  }

  void _wrapperStartPlanting(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return StartPlanting();
            }
        )
    );
  }

  void _wrapperJournal(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Journal();
            }
        )
    );
  }
}


