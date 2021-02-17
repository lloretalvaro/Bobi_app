import 'package:flutter/material.dart';
import 'feature_button.dart';

class FeatureRow extends StatelessWidget {
  FeatureRow(
      {@required this.buttonIcon,
      @required this.buttonOnPress,
      @required this.buttonText});

  final IconData buttonIcon;
  final Function buttonOnPress;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: FeatureButton(
            myIcon: buttonIcon,
            onPress: buttonOnPress,
            myText: buttonText,
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blue,
            height: 150,
            width: 150,
            child: Image.asset('assets/images/bobi_logo.png'),
          ),
        ),
      ],
    );
  }
}
