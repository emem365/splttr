import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/currency.dart';

class OwesOrDuesList extends StatelessWidget {
  final List userList;
  final bool userOwesYou;
  OwesOrDuesList({
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
          child: Avatars.getAssetFromName(user['avatar']),
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