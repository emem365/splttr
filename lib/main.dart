import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/home.dart';
import 'package:splttr/pages/friends.dart';
import 'package:splttr/pages/outings.dart';
import 'package:splttr/pages/history.dart';


void main() => runApp(MyApp());

const primaryColor = Color(0xFFF2F2F2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF250A40),
      ),
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final GlobalKey _scaffold=GlobalKey();
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key : _scaffold,
        appBar: ShiftingTabBar(
          tabs: <ShiftingTab>[
            ShiftingTab(
              icon: Icon(FontAwesomeIcons.home),
              text: "Home",
            ),
            ShiftingTab(
              icon: Icon(FontAwesomeIcons.userFriends),
              text: "Friends",
            ),
            ShiftingTab(
              icon: Icon(FontAwesomeIcons.running),
              text: "Outings",
            ),
            ShiftingTab(
              icon: Icon(FontAwesomeIcons.history),
              text: "History",
            ),
            ShiftingTab(
              icon: Icon(FontAwesomeIcons.bars),
              text: "Menu",
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Friends(),
            Outings(),
            History(),
            Material(color: Theme.of(context).primaryColor, child: Center(child: Text('Menu'))),  
          ],
        ),
      ),
    );
  }
}