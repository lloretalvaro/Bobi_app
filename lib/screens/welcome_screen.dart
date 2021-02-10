import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: Center(
        child: Text(
          'Welcome',
          style: kRegularTextStyle,
        ),
      ),
    );
  }
}
