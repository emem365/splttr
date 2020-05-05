import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';

class OutingSettlementsTab extends StatefulWidget {
  @override
  _OutingSettlementsTabState createState() => _OutingSettlementsTabState();
}

class _OutingSettlementsTabState extends State<OutingSettlementsTab> {
  List<Map> _outingSettlementsList = DummyData.outingSettlementsList;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _outingSettlementsList.length + 1,
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
                              _outingSettlementsList[index]['from-avatar']),
                        ),
                        Icon(FontAwesomeIcons.arrowRight),
                        CircleAvatar(
                          radius: 30,
                          child: Avatars.getAssetFromName(
                              _outingSettlementsList[index]['to-avatar']),
                        ),
                      ],
                    ),
                    Text(
                      '${_outingSettlementsList[index]['from']} gives ${Currency.currencyFormat.format(_outingSettlementsList[index]['amount'])} to ${_outingSettlementsList[index]['to']}',
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