import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/large_avatar_tile.dart';

class Groups extends StatelessWidget {
  final List _groupsList = DummyData.groups;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Groups'),
      ),
      floatingActionButton: FloatingActionButton.extended(
            backgroundColor: PurpleTheme.lightPurple,
            onPressed: () {},
            icon: Icon(
              Icons.add,
            ),
            label: Text(
              'Add a group',
              style: Theme.of(context).textTheme.button.copyWith(
                    letterSpacing: 1.0,
                    fontSize: 14.0,
                  ),
            ),
          ),
      body: (_groupsList.length == 0)
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
                    body: LargeAvatarTile.createBodyFromList(
                        _groupsList[index]['members']),
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
