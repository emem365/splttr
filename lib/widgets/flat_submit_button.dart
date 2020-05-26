import 'package:flutter/material.dart';

class FlatSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;

  FlatSubmitButton({
    @required this.onPressed,
    @required this.labelText,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 75),
      onPressed: onPressed,
      child: Text(
        labelText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: Theme.of(context).primaryColor,
      shape: StadiumBorder(),
    );
  }
}
