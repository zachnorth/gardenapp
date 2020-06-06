import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gardenapp/screens/authenticate/authenticate.dart';
import 'package:gardenapp/screens/home/home.dart';
import 'package:gardenapp/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}