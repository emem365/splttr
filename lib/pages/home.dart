import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/chart.dart';
import 'package:splttr/res/dummy_data.dart';

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

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ((_youOweUsersList.length > 0) && (_usersOweYouList.length > 0))
        ? ListView(
            children: <Widget>[
              Container(
                // margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                // color: Theme.of(context).canvasColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/1.25,
                  height: MediaQuery.of(context).size.width/1.25,
                  child: Chart(_chartSeries, _total),
                ),
              ),
              (_usersOweYouList.length > 0)
                  ? _OwesOrDues(userList: _usersOweYouList, userOwesYou: true)
                  : Container(),
              (_youOweUsersList.length > 0)
                  ? _OwesOrDues(userList: _youOweUsersList, userOwesYou: false)
                  : Container(),

              // _OwesOrDues(userList: _youOweUsersList, userOwesYou: false),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.solidThumbsUp,
                size: MediaQuery.of(context).size.width / 5,
                color: Color(0xFF41D9AE),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
              ),
              Text(
                'You\'re all caught up!',
                style: Theme.of(context).textTheme.display1.copyWith(
                      color: Color(0xFF41D9AE),
                    ),
              ),
            ],
          );
  }
}

class _OwesOrDues extends StatelessWidget {
  final List userList;
  final bool userOwesYou;
  _OwesOrDues({
    Key key,
    @required this.userList,
    @required this.userOwesYou,
  })  : assert(userList.length > 0),
        super(key: key);

  double _getTotal() {
    double total = 0;
    userList.forEach((user) {
      total += user['amount'];
    });
    return total;
  }

  List<Widget> _buildList() {
    var _color = userOwesYou ? Currency.profitColor : Currency.lossColor;
    List<Widget> lis = [
      ListTile(
        title: Text(
          userOwesYou ? 'You are due:' : 'You Owe :',
        ),
        trailing: Text(
          '${userOwesYou ? '+' : ''}${Currency.currencyFormat.format(_getTotal())}',
          style: TextStyle(
            fontSize: 24.0,
            color: _color,
          ),
        ),
      ),
      Divider(),
    ];
    userList.forEach((user) {
      lis.add(ListTile(
        leading: CircleAvatar(
          child: Icon(
            FontAwesomeIcons.user,
            color: Colors.white,
          ),
          backgroundColor: _color,
        ),
        title: Text(
          '${user['username']}',
        ),
        subtitle: Text(
          'Last expense from ${user['last_trans']}',
        ),
        trailing: Text(
          '${userOwesYou ? '+' : ''}${Currency.currencyFormat.format(user['amount'])}',
          style: TextStyle(
            color: _color,
          ),
        ),
      ));
      lis.add(Divider());
    });
    return lis;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      // padding: EdgeInsets.all(16.0),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildList()),
      ),
    );
  }
}
