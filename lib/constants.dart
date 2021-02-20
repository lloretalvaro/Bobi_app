import 'package:flutter/material.dart';

const kRegularTextStyle = TextStyle(
  color: Color(0xFFEEEEEE),
  fontSize: 23,
  fontWeight: FontWeight.w600,
);

const kWelcomeTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 80,
  fontWeight: FontWeight.w600,
  fontFamily: 'FredokaOne',
);

const Color kFeatureExplanationColor = Color(0xFF1D1E33);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.notifications,
      color: Colors.white,
      size: 35,
    ),
    hintText: 'La notificación a enviar...',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ));

const kTextFieldInputPreguntaDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Inserta tu pregunta...',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ));

const kTextFieldInputRespuestaDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Inserta tu respuesta...',
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide.none,
    ));

// AUTH RELATED
const String kAUTH_DOMAIN =
    'eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e';
const String kAUTH_TOKEN =
    'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/token';
const String kAUTH_USERINFO =
    'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/userinfo';
const String kAUTH_CLIENT_ID = '5c16b981-a508-45b8-a11f-3b34bd8a3c42';
const String kAUTH_REDIRECT_URI = 'com.bobiapp.auth://login-callback';
const String kAUTH_ISSUER = 'https://$kAUTH_DOMAIN';
