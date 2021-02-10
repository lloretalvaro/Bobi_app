import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
