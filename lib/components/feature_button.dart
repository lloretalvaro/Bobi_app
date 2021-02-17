import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  FeatureButton(
      {@required this.myIcon, @required this.onPress, @required this.myText});

  final IconData myIcon;
  final Function onPress;
  final String myText;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(myIcon),
          Text(myText),
        ],
      ),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 150, height: 150),
      fillColor: Colors.green,
    );
  }
}
