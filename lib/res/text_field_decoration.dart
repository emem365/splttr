import 'package:flutter/material.dart';

class TextFieldDecoration {
  static InputDecoration circularBorderDecoration({
    Widget icon,
    String labelText,
    String hintText,
  }) =>
      InputDecoration(
        icon: icon,
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
        ),
      );
}
