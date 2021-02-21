import 'package:bobi_app/app_id_logic.dart';
import 'package:bobi_app/components/custom_button.dart';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'profile_screen.dart';
import 'feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';

import 'registration_screen.dart';

import 'package:provider/provider.dart';
import 'package:bobi_app/screens/bloc.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class WelcomeScreen extends StatefulWidget {
  static const id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;

  //AppId functions, other 2 methods used here are implemented in app_id_logic.dart
  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          kAUTH_CLIENT_ID,
          kAUTH_REDIRECT_URI,
          issuer: 'https://$kAUTH_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );
      // final AuthorizationServiceConfiguration _serviceConfiguration =
      //     AuthorizationServiceConfiguration(
      //         'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/authorization',
      //         'https://eu-de.appid.cloud.ibm.com/oauth/v4/692743c7-d888-4087-8f01-7144f69d059e/token');

      // final AuthorizationTokenResponse result =
      //     await appAuth.authorizeAndExchangeCode(
      //   AuthorizationTokenRequest(
      //     kAUTH_CLIENT_ID,
      //     kAUTH_REDIRECT_URI,
      //     serviceConfiguration: _serviceConfiguration,
      //     scopes: [],
      //     preferEphemeralSession: false,
      //   ),
      // );

      final appId = AppIdLogic();
      final idToken = appId.parseAuthCode(result.idToken);
      final profile = await appId.getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        // name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }

  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;

    setState(() {
      isBusy = true;
    });

    try {
      final response = await appAuth.token(TokenRequest(
        kAUTH_CLIENT_ID,
        kAUTH_REDIRECT_URI,
        issuer: kAUTH_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final appId = AppIdLogic();
      final idToken = appId.parseAuthCode(response.idToken);
      final profile = await appId.getUserDetails(response.accessToken);

      secureStorage.write(key: 'refresh_token', value: response.refreshToken);

      setState(() {
        isBusy = false;
        isLoggedIn = true;
        // name = idToken['name'];
        picture = profile['picture'];
      });
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }

  // UI functions
  Widget registrationButton() {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 18,
      child: RaisedButton(
        child: Text('Registration //a lo mejor lo quitamos'),
        onPressed: () {
          if (true) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FeatureScreen()));
          }
        },
      ),
    );
  }

  //TODO: Take into account the isBusy to show a CircularProgressIndicator()
  Widget loginButton(BuildContext context) {
    return CustomButton(
      textString: 'Entrar',
      onPress: () async {
        if (isLoggedIn) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(logoutAction, name, picture)));
        } else {
          await loginAction();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen(logoutAction, name, picture)));
        }

/**
        if (true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FeatureScreen()));
        }
         */
      },
    );
  }

  @override
  void initState() {
    initAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = DeepLinkBloc();
    return Scaffold(
      body: Provider<DeepLinkBloc>(
        create: (context) => _bloc,
        dispose: (context, bloc) => bloc.dispose(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bobi', style: kWelcomeTitleTextStyle),
                Container(
                  child: Image.asset('assets/images/bobi_logo.png'),
                  height: MediaQuery.of(context).size.height / 6,
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 40),
                ),
                loginButton(context),
                registrationButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
