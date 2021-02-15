import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:bobi_app/ibmoauthclient.dart';
import 'package:oauth2_client/access_token_response.dart';

import 'package:google_sign_in/google_sign_in.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> pruebaOauth() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }

    print(_googleSignIn.currentUser.email);
  }

  Future<void> pruebaConIBM() async {
    OAuth2Client ibmClient = IBMOAuth2Client(
        redirectUri: 'com.example.bobi_app://oauth2redirect',
        customUriScheme: 'com.example.bobi_app');

//Request a token using the Client Credentials flow...
    AccessTokenResponse token =
        await ibmClient.getTokenWithClientCredentialsFlow(
      clientId: '5c16b981-a508-45b8-a11f-3b34bd8a3c42', //Your client id
      clientSecret:
          'MzViOTRjNzMtOGVhNS00MTJjLTk1YjgtYjMwNzg2NDVkNzU4', //Your client secret
    );

//Or, if you already have a token, check if it is expired and in case refresh it...
    if (token.isExpired()) {
      token = await ibmClient.refreshToken(token.refreshToken);
    }

    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            RaisedButton(
              child: Text('Prueba Google'),
              onPressed: () async {
                await pruebaOauth();
              },
            ),
            RaisedButton(
              child: Text('Prueba IBM'),
              onPressed: () async {
                await pruebaConIBM();
              },
            ),
          ],
        )),
      ),
    );
  }
}
