import 'package:bobi_app/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/custom_button.dart';

class FAQScreenModification extends StatefulWidget {
  static const id = '/FAQmodification';
  @override
  _FAQScreenModificationState createState() => _FAQScreenModificationState();
}

class _FAQScreenModificationState extends State<FAQScreenModification> {
  String pregunta;
  String respuesta;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobi'),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          child: Text(
            'Añadir',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            FAQ faq = FAQ(pregunta: pregunta, respuesta: respuesta);
            Navigator.pop(context, faq);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pregunta que quieras aclarar'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputPreguntaDecoration,
                  onChanged: (value) => pregunta = value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Respuesta a la pregunta'),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputRespuestaDecoration,
                  onChanged: (value) => respuesta = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
