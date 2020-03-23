import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  
  final _placeholderWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        FontAwesomeIcons.userFriends,
        color: Colors.white,
        size: 48.0,
      ),
      SizedBox(
        width: 24.0,
      ),
      Text(
        'Friends / Groups',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36.0,
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
