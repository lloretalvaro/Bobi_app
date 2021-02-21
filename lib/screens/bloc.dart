import 'dart:async';

import 'package:flutter/services.dart';
import 'package:bobi_app/app_id_logic.dart';

abstract class Bloc {
  void dispose();
}

class DeepLinkBloc extends Bloc {
  //Event Channel creation
  static const stream = const EventChannel('com.bobiapp.auth/events');

  //Method channel creation
  static const platform = const MethodChannel('com.bobiapp.auth/channel');

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
    // Here can be any uri analysis, checking tokens etc, if it’s necessary
    // Throw deep link URI into the BloC's stream
    // print(uri);
    final AppIdLogic logic = AppIdLogic();
    final code = logic.parseAuthCode(uri);
    // print(code);
    final accessToken = await logic.getAccessTokenFromAuthCode(code);
    final userData = logic.getUserDetails(accessToken['access_token']);

    // await secureStorage.write(
    //       key: 'refresh_token', value: result.refreshToken);
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
