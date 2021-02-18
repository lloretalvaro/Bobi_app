import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget {
  FeatureButton(
      {@required this.myIcon, @required this.onPress, @required this.myText});

  final IconData myIcon;
  final Function onPress;
  final String myText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange[400],
        borderRadius: BorderRadius.circular(13),
      ),
      margin: EdgeInsets.fromLTRB(15, 50, 13, 20),
      child: RawMaterialButton(
        onPressed: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              myIcon,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(myText),
          ],
        ),
        constraints: BoxConstraints.tightFor(width: 150, height: 150),
      ),
    );
  }
}
