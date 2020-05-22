import 'package:flutter/material.dart';
import 'package:splttr/pages/home/owes_dues_chart.dart';
import 'package:splttr/pages/home/owes_dues_list.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final _usersOweYouList = DummyData.usersOweYouList;
  final _youOweUsersList = DummyData.youOweUsersList;

  List<Widget> _buildListViewItems() {
    List<Widget> items = [
      Container(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          height: MediaQuery.of(context).size.width / 1.25,
          child: OwesDuesChart(),
        ),
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
                  'Add a friend',
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
                onPressed: (){},
                child: Text(
                  'Split an expense',
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
    ];
    if ((_youOweUsersList.length == 0) && (_usersOweYouList.length == 0)) {
      items.add(EmptyListEmoticonMessage(
        message: 'All your dues are clear :)',
        emotion: Emotion.happy,
      ));
    } else {
      if (_usersOweYouList.length > 0) {
        items
            .add(OwesOrDuesList(userList: _usersOweYouList, userOwesYou: true));
      }
      if (_youOweUsersList.length > 0) {
        items.add(
            OwesOrDuesList(userList: _youOweUsersList, userOwesYou: false));
      }
    }
    return items;
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(children: _buildListViewItems());
  }
}
