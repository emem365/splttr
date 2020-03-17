import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/home.dart';
import 'package:splttr/pages/friends.dart';
import 'package:splttr/pages/outings.dart';
import 'package:splttr/pages/history.dart';

void main() => runApp(MyApp());

const primaryColor = Color(0xFFF2F2F2);
const accentColor = Color(0xFFBF395D);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF250A40),
        accentColor: accentColor,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          ListTile(
            onTap: () {
              print('heh');
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
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '@username',
                        style: Theme.of(context).textTheme.subtitle,
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
                      leading:
                          Icon(FontAwesomeIcons.search, color: Colors.black, size: 24.0),
                      title: Text(
                        'SEARCH',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading:
                          Icon(FontAwesomeIcons.userFriends, color: Colors.black, size: 24.0),
                      title: Text(
                        'FRIENDS LIST',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading:
                          Icon(FontAwesomeIcons.rupeeSign, color: Colors.black, size: 24.0),
                      title: Text(
                        'YOUR EXPENDITURE',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading:
                          Icon(FontAwesomeIcons.userAlt, color: Colors.black, size: 24.0),
                      title: Text(
                        'YOUR PROFILE',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
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
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading:
                          Icon(FontAwesomeIcons.signOutAlt, color: Colors.black, size: 24.0),
                      title: Text(
                        'LOGOUT',
                        style: Theme.of(context).textTheme.headline.copyWith(
                              letterSpacing: 2,
                            ),
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
