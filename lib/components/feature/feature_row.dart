import 'package:flutter/material.dart';
import '../buttons/feature_button.dart';
import 'feature_explanation.dart';

class FeatureRow extends StatelessWidget {
  FeatureRow(
      {@required this.buttonIcon,
      @required this.buttonOnPress,
      @required this.buttonText,
      @required this.explanationFeatureText});

  final IconData buttonIcon;
  final Function buttonOnPress;
  final String buttonText;
  final String explanationFeatureText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: FeatureButton(
            myIcon: buttonIcon,
            onPress: buttonOnPress,
            myText: buttonText,
          ),
        ),
        Expanded(
          flex: 5,
          child: FeatureExplanation(
            explanationText: explanationFeatureText,
          ),
        ),
      ],
    );
  }
}
