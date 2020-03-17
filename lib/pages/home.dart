import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  
  final _placeholderWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        FontAwesomeIcons.home,
        color: Colors.white,
        size: 48.0,
      ),
      SizedBox(
        width: 24.0,
      ),
      Text(
        'Home',
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
