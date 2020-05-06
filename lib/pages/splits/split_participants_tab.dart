import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';

class SplitParticipantsTab extends StatefulWidget {
  @override
  _SplitParticipantsTabState createState() => _SplitParticipantsTabState();
}

class _SplitParticipantsTabState extends State<SplitParticipantsTab> {
  List<Map> _participantsList = DummyData.splitParticipantList;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _participantsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: SmallAvatarTile(
              avatar: _participantsList[index]['avatar'],
              title: _participantsList[index]['username'],
              subtitle:
                  'Spent: ${Currency.currencyFormat.format(_participantsList[index]['spent'])}',
              actions: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.trashAlt),
                  onPressed: () => print('trash'),
                ),
              ],
              onTap: () => print('tile'),
            ),
          );
        },
      ),
    );
  }
}