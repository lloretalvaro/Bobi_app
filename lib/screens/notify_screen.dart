import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/custom_button.dart';

class NotifyScreen extends StatefulWidget {
  static const id = '/notify';
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  String notificacion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿Qué quieres enviar a tus clientes?'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) => notificacion = value,
                ),
              ),
              CustomButton(
                textString: 'Enviar',
                onPress: () {
                  //TODO: Aqui guardaría la notificacion en la BD,
                  // despues python se daría cuenta y mandaría
                  // dicha notifacion al chat de mensajeria
                  notificacion == null
                      ? print('Notifacion es nula')
                      : print(notificacion);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
