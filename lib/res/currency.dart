import 'package:intl/intl.dart';
import 'package:splttr/res/colors.dart';

class Currency{
  static final currencyFormat = NumberFormat.simpleCurrency(name: 'INR');
  static final profitColor = CurrencyColors.profitColor;
  static final lossColor = CurrencyColors.lossColor;
}

