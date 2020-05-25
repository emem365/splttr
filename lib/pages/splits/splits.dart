import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/splits/split_description.dart';
import 'package:splttr/widgets/large_avatar_tile.dart';
import 'package:splttr/dataPages/user.dart';

class Splits extends StatefulWidget {
  final User signinedUser;
  Splits(this.signinedUser);
  @override
  _SplitsState createState() => _SplitsState(signinedUser);
}

class _SplitsState extends State<Splits> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  final User signinedUser;
  _SplitsState(this.signinedUser);
  List _splitsList = DummyData.splitsList;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _splitsList.length + 1,
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
                      'assets/images/outings.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Splits',
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
                            'Add Group',
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
                            'Add split',
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
                (_splitsList.length == 0)
                    ? EmptyListEmoticonMessage(
                        message:
                            'You have no splits :(\n\nGo ahead, add a split, share your expenses.',
                        emotion: Emotion.sad,
                      )
                    : null,
              ].where((widget) => widget!=null).toList(),
            ),
          );
        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: LargeAvatarTile(
              tag: _splitsList[index]['tag'],
              avatar: _splitsList[index]['avatar'],
              title: _splitsList[index]['outing-name'],
              body: LargeAvatarTile.createBodyFromList(_splitsList[index]['friends']),
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
    );
  }
}
