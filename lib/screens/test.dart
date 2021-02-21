import 'package:bobi_app/screens/poc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bobi_app/screens/bloc.dart';

class PocApp extends StatelessWidget {
  static const id = "PocApp";

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
