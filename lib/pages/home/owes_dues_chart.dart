import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:splttr/pages/home/owes_dues_chart_data.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/chart.dart';

class OwesDuesChart extends StatelessWidget {
  final _usersOweYouList = DummyData.usersOweYouList;
  final _youOweUsersList = DummyData.youOweUsersList;

  List<charts.Series> _buildChartData() {
    List<OwesDuesChartData> _chartData;
    List<charts.Series> _chartSeries;
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
    return _chartSeries;
  }

  int _calculateTotal() {
    int total = 0;
    _usersOweYouList.forEach((user) {
      total += user['amount'];
    });
    _youOweUsersList.forEach((user) {
      total += user['amount'];
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Chart(_buildChartData(), _calculateTotal());
  }
}
