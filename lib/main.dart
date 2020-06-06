import 'package:flutter/material.dart';
import 'package:gardenapp/screens/authenticate/authenticate.dart';
import 'package:gardenapp/screens/authenticate/sign_in.dart';
import 'package:gardenapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gardenapp/models/user.dart';
import 'package:gardenapp/screens/wrappers/wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Garden',
      color: Colors.green,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green[400]
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('My Garden'),
        backgroundColor: Colors.lightGreen[300],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Welcome to your garden!',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 40.0),
            RaisedButton(
              color: Colors.green,
              child: Text('Login/Sign Up', style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey[500])
              ),
              onPressed: () => _wrapper(context),
            ),
            RaisedButton(
              color: Colors.blueGrey,
              child: Text('Check out our website', style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey[500])
              ),
              onPressed: () => _launchURL(),
            )
          ],
        ),
      ),
    );
  }

  void _wrapper(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return StreamProvider<User>.value(
                value: AuthService().user,
                child: MaterialApp(
                  home: Wrapper(),
                ),
              );
            }
        )
    );
  }

  _launchURL() async {
    const url = 'https://www.teachmetogrow.com/';
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
