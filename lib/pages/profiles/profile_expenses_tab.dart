import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';

class ProfileExpenses extends StatelessWidget {
  final _expensesList = DummyData.expensesList;
  final List divisions = List();
  void seperateDivisions() {
    DateTime currentDate;
    int count = -1;
    _expensesList.forEach((expense) {
      if (expense['date'] != currentDate) {
        count++; //if it is not equalto currentdate that would mean it is not in the divisions map yet. We use this lil hack only cz  we knoe the list is sorted
        divisions.add(List());
        divisions[count].add(expense);
        currentDate = expense['date'];
      } else {
        divisions[count].add(expense);
      }
    });
  }

  void _sortByDate() {
    _expensesList.sort((expense1, expense2) {
      DateTime date1 = expense1['date'];
      DateTime date2 = expense2['date'];
      return date2.compareTo(date1);
    });
  }

  @override
  Widget build(BuildContext context) {
    _sortByDate();
    seperateDivisions();
    return Material(
      color: Colors.white,
      child: (_expensesList.length == 0)
          ? Center(
              child: EmptyListEmoticonMessage(
              message: 'You haven\'t added any groups yet :(',
              emotion: Emotion.sad,
            ))
          : ListView.builder(
              itemCount: _expensesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              child: SmallAvatarTile(
                avatar: _expensesList[index]['avatar'],
                title: _expensesList[index]['expense-title'],
                subtitle:
                    'Amount: ${Currency.currencyFormat.format(_expensesList[index]['amount'])}',
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
              ),
            );
              },
            ),
    );
  }
}
