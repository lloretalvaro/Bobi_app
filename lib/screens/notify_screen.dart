import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/custom_button.dart';
import 'package:bobi_app/server.dart' as server;

enum StatusNotificacion {
  noEnviado,
  enviadoExitoso,
  envioFallado,
}

class NotifyScreen extends StatefulWidget {
  static const id = '/notify';
  @override
  _NotifyScreenState createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  String notificacion;
  final messageTextController = TextEditingController();
  StatusNotificacion statusNotificacion = StatusNotificacion.noEnviado;

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
              statusNotificacion == StatusNotificacion.noEnviado
                  ? SizedBox()
                  : statusNotificacion == StatusNotificacion.enviadoExitoso
                      ? Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 50,
                        )
                      : Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  textString: 'Enviar',
                  onPress: () async {
                    if (notificacion != null && notificacion != '') {
                      try {
                        await server.guardarNotificacion(notificacion);
                        messageTextController.clear();
                        setState(() {
                          statusNotificacion =
                              StatusNotificacion.enviadoExitoso;
                        });
                      } catch (e) {
                        setState(() {
                          statusNotificacion = StatusNotificacion.envioFallado;
                        });
                      } finally {
                        notificacion = '';
                      }
                    } else {
                      setState(() {
                        statusNotificacion = StatusNotificacion.envioFallado;
                      });
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
