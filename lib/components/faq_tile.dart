import 'package:bobi_app/screens/faq_screen_modification.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/models/faq.dart';
import 'package:bobi_app/server.dart' as server;

class FAQTile extends StatefulWidget {
  FAQTile(FAQ faq) {
    this.preguntaTile = faq.getPregunta();
    this.respuestaTile = faq.getRespuesta();
    this.faq = faq;
  }

  FAQ faq;
  String preguntaTile;
  String respuestaTile;

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () async {
        var faqModificado = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FAQScreenModification(
              preguntaInputDecoration: kTextFieldInputPreguntaDecoration
                  .copyWith(hintText: widget.preguntaTile),
              respuestaInputDecoration: kTextFieldInputRespuestaDecoration
                  .copyWith(hintText: widget.respuestaTile),
            ),
          ),
        );

        if (faqModificado != null) {
          FAQ faqConvertido = faqModificado;
          setState(() {
            widget.preguntaTile = faqConvertido.getPregunta();
            widget.respuestaTile = faqConvertido.getRespuesta();
          });
          server.modificarFaq(widget.faq.getObjectId(),
              faqConvertido.getPregunta(), faqConvertido.getRespuesta());
        }
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color: kFeatureExplanationColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('P: ${widget.preguntaTile}'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('R: ${widget.respuestaTile}',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
