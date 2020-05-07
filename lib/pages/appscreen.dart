import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/home.dart';
import 'package:splttr/pages/friends.dart';
import 'package:splttr/pages/splits/splits.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/pages/expenses.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: ShiftingTabBar(
          labelStyle: Theme.of(context).textTheme.headline5.copyWith(
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
                FontAwesomeIcons.running,
                color: Colors.white70,
              ),
              text: "Splits",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.history,
                color: Colors.white70,
              ),
              text: "Expenses",
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
            Splits(),
            Expenses(),
            Friends(),
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
    final _textTheme = Theme.of(context).textTheme.headline5.copyWith(
          letterSpacing: 2,
          color: Colors.white,
          fontSize: 20,
        );
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          FlatButton(
            onPressed: () {
              print('Link to your profile');
            },
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: PurpleTheme.pinkishPurple,
                  minRadius: MediaQuery.of(context).size.width / 8,
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
                        style: Theme.of(context).textTheme.subtitle2.apply(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white70,
                        size: 20.0,
                      ),
                      title: Text(
                        'Search',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.userAlt,
                        color: Colors.white70,
                        size: 20.0,
                      ),
                      title: Text(
                        'Your Profile',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white70,
                        size: 20.0,
                      ),
                      title: Text(
                        'Settings',
                        style: _textTheme,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.white70,
                        size: 20.0,
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
