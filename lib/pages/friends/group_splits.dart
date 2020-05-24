import 'package:flutter/material.dart';
import 'package:splttr/pages/splits/split_description.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/large_avatar_tile.dart';
import 'package:intl/intl.dart';

class GroupSplits extends StatelessWidget {
  final List _splitsList = DummyData.splitsList;
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');

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
        title: Text('Splits with groupname'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PurpleTheme.lightPurple,
        onPressed: () {},
        icon: Icon(
          Icons.add,
        ),
        label: Text(
          'Add a split',
          style: Theme.of(context).textTheme.button.copyWith(
                letterSpacing: 1.0,
                fontSize: 14.0,
              ),
        ),
      ),
      body: (_splitsList.length == 0)
          ? Center(
              child: EmptyListEmoticonMessage(
              message: 'You haven\'t added any splits with this group yet :(',
              emotion: Emotion.sad,
            ))
          : ListView.builder(
              itemCount: _splitsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                  child: LargeAvatarTile(
                      tag: _splitsList[index]['tag'],
                      avatar: _splitsList[index]['avatar'],
                      title: _splitsList[index]['outing-name'],
                      body: LargeAvatarTile.createBodyFromList(
                          _splitsList[index]['friends']),
                      subtitle: _dateformat.format(_splitsList[index]['date']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SplitPage(
                              tag: _splitsList[index]['tag'],
                              name: _splitsList[index]['outing-name'],
                              avatar: _splitsList[index]['avatar'],
                            ),
                          ),
                        );
                      },
                      backgroundColor: PurpleTheme.blue,
                      splashColor: Theme.of(context).splashColor),
                );
              },
            ),
    );
  }
}
