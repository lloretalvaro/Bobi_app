import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget registrationButton() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 20,
      child: RaisedButton(
        child: Text('Registration'),
        onPressed: () {
          Navigator.pushNamed(context, RegistrationScreen.id);
        },
      ),
    );
  }

  Widget loginButton() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 20,
      child: RaisedButton(
        child: Text('Login'),
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/bobi_logo.png'),
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text('hey'),
            SizedBox(
              height: 20,
            ),
            loginButton(),
            registrationButton(),
          ],
        ),
      ),
    );
  }
}
