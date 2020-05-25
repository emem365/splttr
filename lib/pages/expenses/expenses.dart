import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/app_screen_title_with_image_widget.dart';
import 'package:splttr/widgets/empty_list_message.dart';
import 'package:intl/intl.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';
import 'package:splttr/widgets/two_button_row.dart';

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
          return AppScreenTitleWithImageWidget(
            imagePath: 'assets/images/split.png',
            title: 'Expenses',
            buttonRow: TwoButtonRow(
              buttonOneOnPressed: () {},
              buttonOneText: 'Add Split',
              buttonTwoOnPressed: () {},
              buttonTwoText: 'Add expense',
            ),
            showEmptyListMessage: (_expensesList.length == 0),
            message: EmptyListEmoticonMessage(
              emotion: Emotion.happy,
              message:
                  'You have not added any expenses yet. You can start by pressing the \"Add Expenses\" button :)',
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
