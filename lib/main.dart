import 'package:flutter/material.dart';
import 'screens/faq_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/login_screen.dart';
import 'screens/notify_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(BobiApp());

class BobiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        NotifyScreen.id: (context) => NotifyScreen(),
        InventoryScreen.id: (context) => InventoryScreen(),
        FAQScreen.id: (context) => FAQScreen(),
      },
    );
  }
}
