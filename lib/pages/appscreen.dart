import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/friends/friends.dart';
import 'package:splttr/pages/home/home.dart';
import 'package:splttr/pages/splits/splits.dart';
import 'package:splttr/pages/expenses/expenses.dart';
import 'package:splttr/pages/menu/menu.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: ShiftingTabBar(
          labelStyle: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
          tabs: <ShiftingTab>[
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.home,
                color: Colors.white70,
              ),
              text: "Home",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.running,
                color: Colors.white70,
              ),
              text: "Splits",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.history,
                color: Colors.white70,
              ),
              text: "Expenses",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.userFriends,
                color: Colors.white70,
              ),
              text: "Friends",
            ),
            ShiftingTab(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white70,
              ),
              text: "Menu",
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Home(),
            Splits(),
            Expenses(),
            Friends(),
            Menu(),
          ],
        ),
      ),
    );
  }
}