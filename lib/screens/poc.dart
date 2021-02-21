import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bobi_app/screens/bloc.dart';
import 'profile_screen.dart';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:bobi_app/constants.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();

class PocWidget extends StatelessWidget {
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

  void logoutAction() async {
    // await secureStorage.delete(key: 'refresh_token');
    // setState(() {
    //   isLoggedIn = false;
    //   isBusy = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    return StreamBuilder<String>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
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
          return ProfileScreen(logoutAction, snapshot.data);
        }
      },
    );
  }
}
