import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';

class FAQTile extends StatelessWidget {
  FAQTile({@required this.preguntaTile, @required this.respuestaTile});

  final String preguntaTile;
  final String respuestaTile;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
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
              child: Text('P: $preguntaTile'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('R: $respuestaTile',
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
