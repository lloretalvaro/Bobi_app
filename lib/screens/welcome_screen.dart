import 'package:bobi_app/components/login/poc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bobi_app/components/login/bloc.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = '/';
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = DeepLinkBloc();
    return Scaffold(
        body: Provider<DeepLinkBloc>(
            create: (context) => _bloc,
            dispose: (context, bloc) => bloc.dispose(),
            child: PocWidget()));
  }
}
