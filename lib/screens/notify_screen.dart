import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/custom_button.dart';
import 'package:bobi_app/server.dart' as server;

class NotifyScreen extends StatefulWidget {
  static const id = '/notify';
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  String notificacion;
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  '¿Qué quieres enviar a tus clientes?',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  controller: messageTextController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) => notificacion = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  textString: 'Enviar',
                  onPress: () async {
                    if (notificacion != null && notificacion != '') {
                      server.guardarNotificacion(notificacion);
                      messageTextController.clear();
                    } else {
                      print('Notifacion es nula');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
