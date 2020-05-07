import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:splttr/res/currency.dart';

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final int total;
  final bool animate;
  Chart(this.seriesList, this.total, {this.animate});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            '${total > 0 ? '+' : ''}${Currency.currencyFormat.format(total)}',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 36,
                  color:
                      (total >= 0) ? Currency.profitColor : Currency.lossColor,
                ),
          ),
        ),
        charts.PieChart(
          seriesList,
          animate: true,
          animationDuration: Duration(milliseconds: 500),
          defaultRenderer:
              new charts.ArcRendererConfig(arcWidth: 5, strokeWidthPx: 5.0),
        ),
      ],
    );
  }
}

class OwesDuesChartData {
  //domain 0 is profit, 1 is loss
  final int domain;
  final int amount;
  final charts.Color color;
  static final _colorGreen = charts.Color(
    r: Currency.profitColor.red,
    g: Currency.profitColor.green,
    b: Currency.profitColor.blue,
    a: Currency.profitColor.alpha,
  );
  static final _colorRed = charts.Color(
    r: Currency.lossColor.red,
    g: Currency.lossColor.green,
    b: Currency.lossColor.blue,
    a: Currency.lossColor.alpha,
  );
  OwesDuesChartData(this.domain, amount)
      : this.amount = (domain == 0) ? amount : amount * -1,
        this.color = (domain == 0) ? _colorGreen : _colorRed;
}
