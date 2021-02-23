import 'package:bobi_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bobi_app/components/login/bloc.dart';
import '../../screens/feature_screen.dart';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:bobi_app/constants.dart';
import 'package:bobi_app/app_id_logic.dart';

import 'package:bobi_app/models/usuario.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

class PocWidget extends StatelessWidget {
  Future checkIfLoggedIn;

  PocWidget() {
    checkIfLoggedIn = initAction();
  }

  Future<Usuario> initAction() async {
    // Has the user made a login before? (refresh token is present)
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) {
      print("RefreshToken Not found");
      return null;
    } else {
      print("found refresh token");
      print(storedRefreshToken);
    }

    // try {
    final AppIdLogic logic = AppIdLogic();
    final accessToken = await logic.refreshToken(storedRefreshToken);
    final rawUserDetails =
        await logic.getUserDetails(accessToken['access_token']);

    return Usuario(rawUserDetails);

    // } catch (e) {}
  }

  // Opens browser for Oauth login, callback is listened  with bloc.dart
  Future<void> loginAction() async {
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
    } catch (e) {}
  }

  // Deletes the token from storage
  void logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
  }

  Widget mainScreenLoginWidget(context, _bloc) {
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        // Listener has NOT registered a callback
        if (!snapshot.hasData) {
          // Default login page with logo and button
          return Container(
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
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 18,
                child: RaisedButton(
                  child: Text('ENTRAR'),
                  onPressed: () {
                    loginAction();
                  },
                ),
              )
            ],
          )));
        } else {
          // A callback was found, goto profile screen
          return FeatureScreen(logoutAction, snapshot.data);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return FutureBuilder<Usuario>(
        future: checkIfLoggedIn,
        builder: (BuildContext context, AsyncSnapshot<Usuario> userSnapshot) {
          switch (userSnapshot.connectionState) {
            // No user logged in
            case ConnectionState.none:
            case ConnectionState.waiting:
              return mainScreenLoginWidget(context, _bloc);
            case ConnectionState.done:
              if (userSnapshot.hasData) {
                return ProfileScreen(logoutAction, userSnapshot.data);
              }
              return mainScreenLoginWidget(context, _bloc);
            // A user logged in already, go to profile screen
            default:
              if (userSnapshot.hasData) {
                return ProfileScreen(logoutAction, userSnapshot.data);
              }
          }
          return Container(
              child: Text(userSnapshot.connectionState.toString()));
        });
  }
}
