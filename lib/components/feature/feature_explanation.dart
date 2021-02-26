import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';

class FeatureExplanation extends StatelessWidget {
  FeatureExplanation({@required this.explanationText});

  final String explanationText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.fromLTRB(13, 50, 15, 20),
      decoration: BoxDecoration(
        color: kFeatureExplanationColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(explanationText),
        ),
      ),
    );
  }
}
