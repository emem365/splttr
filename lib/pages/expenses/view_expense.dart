import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/data/expense.dart';
import 'package:intl/intl.dart';

class ViewExpense extends StatelessWidget {
  final Expense expense = Expense.fromMap(DummyData.expensesList[0]);
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.width / 3 + 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/expenses-banner.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          child: expense.avatar,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            ' ${expense.expenseTitle} ',
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontFamily: 'Montserrat',
                                      backgroundColor: Colors.white54,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.solidTrashAlt,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Expense Details',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Row(
              children: <Widget>[
                Text('Amount'),
                Spacer(),
                Text(
                  Currency.currencyFormat.format(expense.amount),
                  style: Theme.of(context).textTheme.headline5.apply(
                        color: CurrencyColors.lossColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Row(
              children: <Widget>[
                Text('For'),
                Spacer(),
                Text(
                  expense.expenseTitle,
                  style: Theme.of(context).textTheme.headline6.apply(
                        color: CurrencyColors.lossColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Row(
              children: <Widget>[
                Text('At'),
                Spacer(),
                Text(
                  expense.description,
                  style: Theme.of(context).textTheme.headline6.apply(
                        color: CurrencyColors.lossColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Row(
              children: <Widget>[
                Text('On'),
                Spacer(),
                Text(
                  _dateformat.format(expense.date),
                  style: Theme.of(context).textTheme.headline6.apply(
                        color: CurrencyColors.lossColor,
                      ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              onPressed: (){},
              shape: StadiumBorder(),
              color: PurpleTheme.purple,
              child: Text('Edit this expense?', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 8, left: 32,right: 32, bottom: 16,),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              onPressed: (){},
              shape: StadiumBorder(),
              color: CurrencyColors.lossColor,
              child: Text('Delete this expense?', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}