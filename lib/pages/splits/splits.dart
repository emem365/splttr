import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/splits/split-description.dart';

class Splits extends StatefulWidget {
  @override
  _SplitsState createState() => _SplitsState();
}

class _SplitsState extends State<Splits> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List _splitsList = DummyData.splitsList;

  @override
  bool get wantKeepAlive => true;

  String _createBodyForTile(List<String> friendsList) {
    switch (friendsList.length) {
      case 0:
        return '';
      case 1:
        return 'with ${friendsList[0]}';
      case 2:
        return 'with ${friendsList[0]} and ${friendsList[1]}';
      case 3:
        return 'with ${friendsList[0]}, ${friendsList[1]} and ${friendsList[2]}';
      default:
        return 'with ${friendsList[0]}, ${friendsList[1]} and ${friendsList.length - 2} others';
    }
  }

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
                      'images/outings.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Splits',
                  style: Theme.of(context).textTheme.headline.copyWith(
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
              ],
            ),
          );
        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: Tile(
              tag: _splitsList[index]['tag'],
              avatar: _splitsList[index]['avatar'],
              title: _splitsList[index]['outing-name'],
              body: _createBodyForTile(_splitsList[index]['friends']),
              subtitle: _dateformat.format(_splitsList[index]['date']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SplitPage(
                      tag : _splitsList[index]['tag'],
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
