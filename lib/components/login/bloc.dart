import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bobi_app/app_id_logic.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Bloc {
  void dispose();
}

class DeepLinkBloc extends Bloc {
  //Event Channel creation
  static const stream = const EventChannel('com.bobiapp.auth/events');

  //Method channel creation
  static const platform = const MethodChannel('com.bobiapp.auth/channel');

  // Secure Storage
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  StreamController<String> _stateController = StreamController();

  Stream<String> get state => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  //Adding the listener into contructor
  DeepLinkBloc() {
    //Checking application start by deep link
    startUri().then(_onRedirected);
    //Checking broadcast stream, if deep link was clicked in opened appication
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }

  _onRedirected(String uri) async {
    final AppIdLogic logic = AppIdLogic();
    final code = logic.parseAuthCode(uri);

    // DICT_KEYS: (access_token, id_token, token_type, expires_in, refresh_token, scope)
    final accessToken = await logic.getAccessTokenFromAuthCode(code);
    final userData = logic.getUserDetails(accessToken['access_token']);

    // Save refresh token in secure storage for future use
    secureStorage.write(
        key: 'refresh_token', value: accessToken['refresh_token']);

    // Add new state to the sink so listeners can use the data
    stateSink.add(await userData);
  }

  @override
  void dispose() {
    _stateController.close();
  }

  Future<String> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }
}
