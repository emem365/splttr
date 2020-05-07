import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:splttr/res/empty_list_message.dart';
import 'package:splttr/res/resources.dart';
import 'package:splttr/res/chart.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final _usersOweYouList = DummyData.usersOweYouList;
  final _youOweUsersList = DummyData.youOweUsersList;
  List<OwesDuesChartData> _chartData;
  List<charts.Series> _chartSeries;
  var _total;
  void _buildChartData() {
    var _usersOweYouTotal = 0;
    _usersOweYouList.forEach((user) {
      _usersOweYouTotal += user['amount'];
    });
    var _youOweUsersTotal = 0;
    _youOweUsersList.forEach((user) {
      _youOweUsersTotal += user['amount'];
    });
    if (_usersOweYouList.length == 0 && _youOweUsersList.length == 0) {
      _usersOweYouTotal = 1;
      _youOweUsersTotal = -1;
    }
    _chartData = [
      OwesDuesChartData(0, _usersOweYouTotal),
      OwesDuesChartData(1, _youOweUsersTotal),
    ];
    _chartSeries = [
      charts.Series<OwesDuesChartData, int>(
        id: 'Dues',
        domainFn: (OwesDuesChartData chartData, _) => chartData.domain,
        measureFn: (OwesDuesChartData chartData, _) => chartData.amount,
        colorFn: (OwesDuesChartData chartData, _) => chartData.color,
        data: _chartData,
      ),
    ];
    _total = _usersOweYouTotal + _youOweUsersTotal;
  }

  @override
  void initState() {
    super.initState();
    _buildChartData();
  }

  List<Widget> _buildListViewItems() {
    List<Widget> items = [
      Container(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          height: MediaQuery.of(context).size.width / 1.25,
          child: Chart(_chartSeries, _total),
        ),
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
                  'Add a friend',
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
                onPressed: (){},
                child: Text(
                  'Split an expense',
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
    ];
    if ((_youOweUsersList.length == 0) && (_usersOweYouList.length == 0)) {
      items.add(EmptyListEmoticonMessage(
        message: 'All your dues are clear :)',
        emotion: Emotion.happy,
      ));
    } else {
      if (_usersOweYouList.length > 0) {
        items
            .add(OwesOrDuesList(userList: _usersOweYouList, userOwesYou: true));
      }
      if (_youOweUsersList.length > 0) {
        items.add(
            OwesOrDuesList(userList: _youOweUsersList, userOwesYou: false));
      }
    }
    return items;
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: _buildListViewItems()
    );
  }
}

// <Widget>[
//         Container(
//           // margin: EdgeInsets.all(8.0),
//           padding: EdgeInsets.all(16.0),
//           // color: Theme.of(context).canvasColor,
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width / 1.25,
//             height: MediaQuery.of(context).size.width / 1.25,
//             child: Chart(_chartSeries, _total),
//           ),
//         ),
//         Row(
//           children: <Widget>[
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                   padding: EdgeInsets.all(16.0),
//                   shape: StadiumBorder(),
//                   color: PurpleTheme.lightPurple,
//                   onPressed: () {},
//                   child: Text(
//                     'Add a friend',
//                     style: TextStyle(
//                       letterSpacing: 1.0,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                   padding: EdgeInsets.all(16.0),
//                   shape: StadiumBorder(),
//                   color: PurpleTheme.lightPurple,
//                   onPressed: () {},
//                   child: Text(
//                     'Split an expense',
//                     style: TextStyle(
//                       letterSpacing: 1.0,
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         (_usersOweYouList.length > 0)
//             ? OwesOrDuesList(userList: _usersOweYouList, userOwesYou: true)
//             : null,
//         (_youOweUsersList.length > 0)
//             ? OwesOrDuesList(userList: _youOweUsersList, userOwesYou: false)
//             : null,
//         ((_youOweUsersList.length == 0) && (_usersOweYouList.length == 0))
//             ? SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.5,
//                 height: MediaQuery.of(context).size.width / 1.5,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width / 4,
//                         height: MediaQuery.of(context).size.width / 4,
//                         child: Image.asset(
//                           'images/smile.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'All your dues are clear :)',
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context).textTheme.headline6.apply(
//                             color: CurrencyColors.profitColor,
//                             fontFamily: 'Montserrat',
//                           ),
//                     ),
//                   ],
//                 ),
//               )
//             : null,
//         // _OwesOrDues(userList: _youOweUsersList, userOwesYou: false),
//       ].where((widget) => (widget != null)).toList(),
