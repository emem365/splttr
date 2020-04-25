import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/home.dart';
import 'package:splttr/pages/friends.dart';
import 'package:splttr/pages/outings.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/pages/signin.dart';
import 'package:splttr/pages/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splttr',
      theme: ThemeData(
        primaryColor: PurpleTheme.darkPurple,
        scaffoldBackgroundColor: Colors.white, // Color(0xFF393073)
        accentColor: PurpleTheme.pinkishPurple,
        canvasColor: PurpleTheme.blue,
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'Merriweather'),
      ),
      // home: OutingPage(),
      initialRoute: '/home',
      routes: {
        '/': (context) => SigninScreen(),
        '/home': (context) => AppScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ShiftingTabBar(
          labelStyle: Theme.of(context).textTheme.headline.copyWith(
                fontSize: 14,
                color: Colors.white,
                // letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
          tabs: <ShiftingTab>[
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.home,
                color: Colors.white70,
              ),
              text: "Home",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.userFriends,
                color: Colors.white70,
              ),
              text: "Friends",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.running,
                color: Colors.white70,
              ),
              text: "Outings",
            ),
            // ShiftingTab(
            //   icon: Icon(
            //     FontAwesomeIcons.history,
            //     color: Colors.white70,
            //   ),
            //   text: "History",
            // ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white70,
              ),
              text: "Menu",
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Friends(),
            Outings(),
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
          color: Colors.white,
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
                  backgroundColor: PurpleTheme.pinkishPurple,
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
                        'Your Name',
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
                      leading: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Search',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.userFriends,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Friends List',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Your Expenditure',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.userAlt,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Your Profile',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Settings',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.white70,
                        size: 24.0,
                      ),
                      title: Text(
                        'Logout',
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
