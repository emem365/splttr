import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';

class Expense {
  String heroTag;
  String expenseTitle;
  String description;
  DateTime date;
  int amount;
  String avatarName;

  Expense({
    this.heroTag,
    this.expenseTitle,
    this.description = '',
    this.date,
    this.amount,
    this.avatarName = '',
  }) : assert(expenseTitle != null);

  factory Expense.fromMap(Map expense) => Expense(
        heroTag: expense['tag'],
        expenseTitle: expense['expense-title'],
        description: expense['location'],
        date: expense['date'],
        amount: expense['amount'],
        avatarName: expense['avatar'],
      );

  Image get avatar => Avatars.getAssetFromName(this.avatarName);
}
