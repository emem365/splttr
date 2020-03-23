import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  
  final _placeholderWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        FontAwesomeIcons.history,
        color: Colors.white,
        size: 48.0,
      ),
      SizedBox(
        width: 24.0,
      ),
      Text(
        'History',
        style: TextStyle(
          // color: Colors.white,
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
