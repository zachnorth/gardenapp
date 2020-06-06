import 'package:flutter/material.dart';
import 'package:gardenapp/services/auth.dart';
import 'package:gardenapp/screens/home/new_journal_entry.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {

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
            Text('   Journal   ', style: TextStyle(color: Colors.black, fontSize: 30.0, decoration: TextDecoration.underline)),
            SizedBox(height: 40.0),
            MaterialButton(
              height: 38.0,
              minWidth: 120.0,
              color: Colors.green,
              child: Text('New Entry', style: TextStyle(color: Colors.white)),
              onPressed: () => _newJournalEntry(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[500])
              ),
            )
          ],
        ),
      ),
    );
  }

  void _newJournalEntry() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: NewJournalEntry(),
      );
    });
  }
}
