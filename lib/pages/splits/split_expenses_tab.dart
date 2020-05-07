import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/empty_list_message.dart';
import 'package:splttr/res/resources.dart';

class SplitExpensesTab extends StatefulWidget {
  @override
  _SplitExpensesTabState createState() => _SplitExpensesTabState();
}

class _SplitExpensesTabState extends State<SplitExpensesTab> {
  List<Map> _splitExpensesList = DummyData.splitExpensesList;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: (_splitExpensesList.length > 0)
          ? ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: _splitExpensesList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: SmallAvatarTile(
                    avatar: _splitExpensesList[index]['spent-by-avatar'],
                    title: _splitExpensesList[index]['spent-on'],
                    subtitle:
                        'Amount: ${Currency.currencyFormat.format(_splitExpensesList[index]['amount'])}',
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
            )
          : Center(
              child: EmptyListEmoticonMessage(
                message: 'Add an expense',
              ),
            ),
    );
  }
}
