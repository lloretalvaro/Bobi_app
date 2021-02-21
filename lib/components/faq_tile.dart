import 'package:bobi_app/screens/faq_screen_modification.dart';
import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';
import 'package:bobi_app/models/faq.dart';

class FAQTile extends StatefulWidget {
  FAQTile({@required this.preguntaTile, @required this.respuestaTile});

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
        var faq = await Navigator.push(
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

        if (faq != null) {
          setState(() {
            FAQ faqConvertido = faq;
            widget.preguntaTile = faqConvertido.getPregunta();
            widget.respuestaTile = faqConvertido.getRespuesta();
          });
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
