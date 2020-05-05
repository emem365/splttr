import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';

class OutingExpensesTab extends StatefulWidget {
  @override
  _OutingExpensesTabState createState() => _OutingExpensesTabState();
}

class _OutingExpensesTabState extends State<OutingExpensesTab> {
  List<Map> _outingExpensesList = DummyData.outingExpensesList;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _outingExpensesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: SmallAvatarTile(
              avatar: _outingExpensesList[index]['spent-by-avatar'],
              title: _outingExpensesList[index]['spent-on'],
              subtitle:
                  'Amount: ${Currency.currencyFormat.format(_outingExpensesList[index]['amount'])}',
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.edit,
                    size: 20,
                  ),
                  onPressed: () => print('edit'),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trashAlt,
                    size: 20,
                  ),
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