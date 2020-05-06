import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';

class SplitSettlementsTab extends StatefulWidget {
  @override
  _SplitSettlementsTabState createState() => _SplitSettlementsTabState();
}

class _SplitSettlementsTabState extends State<SplitSettlementsTab> {
  List<Map> _splitSettlementsList = DummyData.splitSettlementsList;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _splitSettlementsList.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return FlatButton(
              onPressed: () {},
              child: Text(
                'Add your share to your expenses? Click here!',
                style: TextStyle(
                  color: PurpleTheme.darkPurple,
                ),
              ),
            );
          }
          index--;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              color: PurpleTheme.blue,
              child: Container(
                height: 125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          child: Avatars.getAssetFromName(
                              _splitSettlementsList[index]['from-avatar']),
                        ),
                        Icon(FontAwesomeIcons.arrowRight),
                        CircleAvatar(
                          radius: 30,
                          child: Avatars.getAssetFromName(
                              _splitSettlementsList[index]['to-avatar']),
                        ),
                      ],
                    ),
                    Text(
                      '${_splitSettlementsList[index]['from']} gives ${Currency.currencyFormat.format(_splitSettlementsList[index]['amount'])} to ${_splitSettlementsList[index]['to']}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}