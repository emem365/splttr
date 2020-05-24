import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';

class ProfileFriends extends StatelessWidget {
  final _friendsList = DummyData.friends;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: (_friendsList.length == 0)
          ? Center(
              child: EmptyListEmoticonMessage(
              message: 'You haven\'t added any friends yet :(',
              emotion: Emotion.sad,
            ))
          : ListView.builder(
              itemCount: _friendsList.length,
              itemBuilder: (BuildContext context, int index) {
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
            ),
    );
  }
}
