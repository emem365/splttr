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