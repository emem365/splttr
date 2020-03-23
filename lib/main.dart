import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/home.dart';
import 'package:splttr/pages/friends.dart';
import 'package:splttr/pages/outings.dart';
import 'package:splttr/pages/history.dart';

void main() => runApp(MyApp());

const primaryColor = Colors.white;
const accentColor = Color(0xFFBF395D);
const canvasColor = Color(0xFF2C2559);
const dividerColor = Colors.white54;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF393073), // Color(0xFF393073)
        accentColor: accentColor,
        canvasColor: canvasColor,
        dividerColor: dividerColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: Colors.white,
              displayColor: Colors.white70,
            ),
      ),
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: ShiftingTabBar(
          labelStyle: Theme.of(context).textTheme.headline.copyWith(
                fontSize: 14,
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
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
            Menu(),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme.headline.copyWith(
          letterSpacing: 2,
          color: Colors.black,
        );
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          ListTile(
            onTap: () {
              print('Link to your profile');
            },
            title: Row(
              children: <Widget>[
                CircleAvatar(
                  minRadius: MediaQuery.of(context).size.width / 6,
                  child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width / 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'YOUR NAME',
                        style: _textTheme.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@username',
                        style: Theme.of(context).textTheme.subtitle.apply(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.search,
                          color: Colors.black, size: 24.0),
                      title: Text(
                        'SEARCH',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.userFriends,
                          color: Colors.black, size: 24.0),
                      title: Text(
                        'FRIENDS LIST',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.rupeeSign,
                          color: Colors.black, size: 24.0),
                      title: Text(
                        'YOUR EXPENDITURE',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.userAlt,
                          color: Colors.black, size: 24.0),
                      title: Text(
                        'YOUR PROFILE',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.settings, color: Colors.black, size: 24.0),
                      title: Text(
                        'SETTINGS',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.signOutAlt,
                          color: Colors.black, size: 24.0),
                      title: Text(
                        'LOGOUT',
                        style: _textTheme,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
