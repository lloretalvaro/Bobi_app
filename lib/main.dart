import 'package:bobi_app/constants.dart';

import 'package:flutter/material.dart';
import 'screens/faq_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/faq_screen_modification.dart';
import 'screens/notify_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(BobiApp());

class BobiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        textTheme: TextTheme(bodyText2: kRegularTextStyle),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        NotifyScreen.id: (context) => NotifyScreen(),
        InventoryScreen.id: (context) => InventoryScreen(),
        FAQScreen.id: (context) => FAQScreen(),
        FAQScreenModification.id: (context) => FAQScreenModification(),
        //ProfileScreen.id: (context) => ProfileScreen(logoutAction, name, picture)
      },
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
    );
  }
}
