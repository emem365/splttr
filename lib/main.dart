import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      home: Material(
        child: Center(
          child: Text(
            'SPLTTR',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w100,
              letterSpacing: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
