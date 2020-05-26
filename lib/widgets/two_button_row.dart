import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';

class TwoButtonRow extends StatelessWidget {
  final String buttonOneText;
  final void Function() buttonOneOnPressed;
  final String buttonTwoText;
  final void Function() buttonTwoOnPressed;
  TwoButtonRow(
      {@required this.buttonOneOnPressed,
      @required this.buttonOneText,
      @required this.buttonTwoOnPressed,
      @required this.buttonTwoText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              8.0,
              8.0,
              4.0,
              8.0,
            ),
            child: RaisedButton(
              padding: EdgeInsets.all(16.0),
              shape: StadiumBorder(),
              color: PurpleTheme.lightPurple,
              onPressed: buttonOneOnPressed,
              child: Text(
                buttonOneText,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              4.0,
              8.0,
              8.0,
              8.0,
            ),
            child: RaisedButton(
              padding: EdgeInsets.all(16.0),
              shape: StadiumBorder(),
              color: PurpleTheme.lightPurple,
              onPressed: buttonTwoOnPressed,
              child: Text(
                buttonTwoText,
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
