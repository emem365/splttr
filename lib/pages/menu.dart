import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';

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
