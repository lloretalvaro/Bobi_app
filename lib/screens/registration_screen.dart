import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:http/http.dart' as http;
import 'package:bobi_app/ibmoauthclient.dart';
import 'package:oauth2_client/access_token_response.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = '/registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> pruebaOauth() async {
    OAuth2Client googleClient = await GoogleOAuth2Client(
        redirectUri:
            'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/Google/callback',
        customUriScheme: 'com.example.bobi_app');

    //Request a token using the Client Credentials flow...
    AccessTokenResponse token =
        await googleClient.getTokenWithClientCredentialsFlow(
      clientId:
          '51602669948-dlpuk0cd41vpg282eb5g6beufikja1ll.apps.googleusercontent.com', //Your client id
      clientSecret: 'kmnpJoCRsEv9TTi8FhfMGpbW', //Your client secret
    );

//Or, if you already have a token, check if it is expired and in case refresh it...
    if (token.isExpired()) {
      token = await googleClient.refreshToken(token.refreshToken);
    }

    print(token);
  }

  Future<void> pruebaConIBM() async {
    OAuth2Client ibmClient = await IBMOAuth2Client(
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
