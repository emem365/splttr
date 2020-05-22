import 'package:charts_flutter/flutter.dart' as charts;
import 'package:splttr/res/currency.dart';


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
