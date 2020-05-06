import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';
import 'package:intl/intl.dart';

class Expenses extends StatefulWidget {
  @override
  _ExpensesState createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List _expensesList = DummyData.expensesList;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _expensesList.length + 1,
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
                      'images/split.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Expenses',
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
              ],
            ),
          );
        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: Tile(
            tag: _expensesList[index]['tag'],
            avatar: _expensesList[index]['avatar'],
            title: _expensesList[index]['expense-title'],
            body: 'at ${_expensesList[index]['location']}',
            subtitle: _dateformat.format(_expensesList[index]['date']),
            onTap: () {},
            backgroundColor: PurpleTheme.blue,
            splashColor: Theme.of(context).splashColor,
            amount: 250,
          ),
        );
      },
    );
  }
}
