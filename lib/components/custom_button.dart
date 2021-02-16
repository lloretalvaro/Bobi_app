import 'package:flutter/material.dart';
import 'package:bobi_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.textString, @required this.onPress});
  final String textString;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 18,
          child: RaisedButton(
            child: Text(
              textString,
              style: kRegularTextStyle,
            ),
            onPressed: onPress,
          )),
    );
  }
}
