import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Outings extends StatefulWidget {
  @override
  _OutingsState createState() => _OutingsState();
}

class _OutingsState extends State<Outings> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  
  final _placeholderWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        FontAwesomeIcons.running,
        color: Colors.white,
        size: 48.0,
      ),
      SizedBox(
        width: 24.0,
      ),
      Text(
        'Outings',
        style: TextStyle(
          color: Colors.white,
          fontSize: 48.0,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child: _placeholderWidget);
  }
}
