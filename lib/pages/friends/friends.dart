import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';
import 'package:splttr/dataPages/user.dart';

class Friends extends StatefulWidget {
  final User signinedUser;
  Friends(this.signinedUser);
  @override
  _FriendsState createState() => _FriendsState(signinedUser);
}

class _FriendsState extends State<Friends> with AutomaticKeepAliveClientMixin {
  List _friendsList = DummyData.friends;
  final User signinedUser;
  _FriendsState(this.signinedUser);

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _friendsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0)
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(32),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Image.asset(
                      'assets/images/friends.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Friends',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          shape: StadiumBorder(),
                          color: PurpleTheme.lightPurple,
                          onPressed: () {},
                          child: Text(
                            'Manage groups',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          padding: EdgeInsets.all(16.0),
                          shape: StadiumBorder(),
                          color: PurpleTheme.lightPurple,
                          onPressed: () {},
                          child: Text(
                            'Add friend',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                (_friendsList.length == 0)
                    ? EmptyListEmoticonMessage(
                        emotion: Emotion.sad,
                        message:
                            'You haven\'t added any friends yet :(\nYou can share expenses with friends or a group of friends. Add someone you know to get started.',
                      )
                    : null,
              ].where((widget) => widget != null).toList(),
            ),
          );
        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: SmallAvatarTile(
            avatar: _friendsList[index]['avatar'],
            title: _friendsList[index]['firstName'] +
                ' ' +
                _friendsList[index]['lastName'],
            subtitle: _friendsList[index]['username'],
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.trashAlt,
                  size: 20,
                ),
                onPressed: () => print('trash'),
              ),
            ],
          ),
        );
      },
    );
  }
}