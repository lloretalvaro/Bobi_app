import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/buttons/custom_button.dart';

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
                  onPress: () {
                    if (notificacion != null && notificacion != '') {
                      print(notificacion);
                      //TODO: Aqui guardaría la notificacion en la BD,
                      // despues python se daría cuenta y mandaría
                      // dicha notifacion al chat de mensajeria
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
