import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/large_avatar_tile.dart';

class ProfileGroups extends StatelessWidget {
  final _groupsList = DummyData.groups;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: (_groupsList.length == 0)
          ? Center(
              child: EmptyListEmoticonMessage(
              message: 'You haven\'t added any groups yet :(',
              emotion: Emotion.sad,
            ))
          : ListView.builder(
              itemCount: _groupsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                  child: LargeAvatarTile(
                    tag: 'group$index',
                    avatar: _groupsList[index]['group-avatar'],
                    title: _groupsList[index]['group-name'],
                    body: LargeAvatarTile.createBodyFromList(_groupsList[index]['members']),
                    onTap: () {
                      //ViewGroupsPage
                    },
                    backgroundColor: PurpleTheme.blue,
                    splashColor: Theme.of(context).splashColor,
                  ),
                );
              },
            ),
    );
  }
}
