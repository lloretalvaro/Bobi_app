import 'package:bobi_app/models/faq.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/components/buttons/custom_button.dart';

class FAQScreenModification extends StatefulWidget {
  static const id = '/FAQmodification';

  FAQScreenModification(
      {this.preguntaInputDecoration, this.respuestaInputDecoration});
  final InputDecoration preguntaInputDecoration;
  final InputDecoration respuestaInputDecoration;

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
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Pregunta que quieras aclarar',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: widget.preguntaInputDecoration ??
                      kTextFieldInputPreguntaDecoration,
                  onChanged: (value) => pregunta = value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Respuesta a la pregunta',
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: widget.respuestaInputDecoration ??
                      kTextFieldInputRespuestaDecoration,
                  onChanged: (value) => respuesta = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                    textString: 'Añadir',
                    onPress: () {
                      FAQ faq;
                      if (pregunta != '' &&
                          pregunta != null &&
                          respuesta != '' &&
                          respuesta != null) {
                        faq = FAQ(pregunta: pregunta, respuesta: respuesta);
                      }

                      Navigator.pop(context, faq);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
