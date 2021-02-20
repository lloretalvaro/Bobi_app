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
