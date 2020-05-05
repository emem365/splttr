import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/outings/outing-description.dart';

class Outings extends StatefulWidget {
  @override
  _OutingsState createState() => _OutingsState();
}

class _OutingsState extends State<Outings> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List _outingsList = DummyData.outingsList;

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
      itemCount: _outingsList.length + 1,
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
                  'Outings',
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
                            'Add Outing',
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
              avatar: _outingsList[index]['avatar'],
              title: _outingsList[index]['outing-name'],
              body: _createBodyForTile(_outingsList[index]['friends']),
              subtitle: _dateformat.format(_outingsList[index]['date']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OutingPage(
                      name: _outingsList[index]['outing-name'],
                      avatar: _outingsList[index]['avatar'],
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