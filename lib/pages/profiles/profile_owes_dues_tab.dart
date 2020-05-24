import 'package:flutter/material.dart';
import 'package:splttr/pages/home/owes_dues_list.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';

class ProfileOwesDues extends StatelessWidget {
  final _usersOweYouList = DummyData.usersOweYouList;
  final _youOweUsersList = DummyData.youOweUsersList;
  List<Widget> _buildListViewItems() {
    List<Widget> items = List<Widget>();
    
      if (_usersOweYouList.length > 0) {
        items
            .add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: OwesOrDuesList(userList: _usersOweYouList, userOwesYou: true),
            ));
      }
      if (_youOweUsersList.length > 0) {
        items.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OwesOrDuesList(userList: _youOweUsersList, userOwesYou: false),
            ));
      }
    
    return items;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: (_usersOweYouList.length == 0) && (_youOweUsersList.length == 0)
          ? Center(
              child: EmptyListEmoticonMessage(
              message: 'You have no dues :)',
              emotion: Emotion.happy,
            ))
          :  ListView(
        children: _buildListViewItems(),
      ),
    );
  }
}