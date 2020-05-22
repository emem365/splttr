import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:intl/intl.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses>
    with AutomaticKeepAliveClientMixin {
  List _expensesList = DummyData.expensesList;
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List divisions = List();
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
      return expense2['date'].compareTo(expense1['date']);
    });
  }

  @override
  void initState() {
    super.initState();
    _sortByDate();
    seperateDivisions();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: divisions.length + 1,
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
                      'assets/images/split.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Expenses',
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
                            'Add split',
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
                            'Add expense',
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
                (_expensesList.length == 0)
                    ? EmptyListEmoticonMessage(
                        emotion: Emotion.happy,
                        message:
                            'You have not added any expenses yet. You can start by pressing the \"Add Expenses\" button :)',
                      )
                    : null,
              ].where((widget) => widget != null).toList(),
            ),
          );
        index--;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(divisions[index].length, (index) {
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
          })
            ..insert(0, Text(_dateformat.format(divisions[index][0]['date'])))
            ..insert(1, Divider()),
        );
      },
    );
  }
}