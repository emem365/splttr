import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/dataPages/user.dart';
import 'package:splttr/res/avatars.dart';

class Menu extends StatelessWidget {
  final User signinedUser;
  Menu(this.signinedUser);
  @override
  Widget build(BuildContext context) {
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
                  radius: MediaQuery.of(context).size.width / 8,
                  child:  Avatars.getAssetFromName(signinedUser.avtar),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        signinedUser.firstName+" "+signinedUser.lastName,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        signinedUser.username,
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
          Padding(
            padding: EdgeInsets.only(top: 16),
          ),
          buildTile(
            context,
            iconData: FontAwesomeIcons.search,
            title: 'Search',
          ),
          Divider(),
          buildTile(
            context,
            iconData: FontAwesomeIcons.userAlt,
            title: 'Your Profile',
          ),
          Divider(),
          buildTile(
            context,
            iconData: FontAwesomeIcons.infoCircle,
            title: 'About',
          ),
          Divider(),
          buildTile(
            context,
            iconData: Icons.settings,
            title: 'Settings',
          ),
          Divider(),
          buildTile(
            context,
            iconData: FontAwesomeIcons.signOutAlt,
            title: 'Logout',
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
          ),
        ],
      ),
    );
  }

  Widget buildTile(BuildContext context,
      {IconData iconData, String title, void Function() onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.white70,
          size: 20.0,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5.copyWith(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 20,
              ),
        ),
        onTap: onTap,
      ),
    );
  }
}
