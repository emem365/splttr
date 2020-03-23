import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final _usersOweYouList = [
    {
      'username': 'user1',
      'last_trans': '22-03-2020',
      'amount': 210,
    },
    {
      'username': 'user2',
      'last_trans': '21-03-2020',
      'amount': 290,
    },
    {
      'username': 'user3',
      'last_trans': '20-03-2020',
      'amount': 190,
    },
    {
      'username': 'user4',
      'last_trans': '10-03-2020',
      'amount': 28,
    },
    {
      'username': 'user5',
      'last_trans': '02-03-2020',
      'amount': 873,
    },
  ];
  final _youOweUsersList = [
    {
      'username': 'user6',
      'last_trans': '22-03-2020',
      'amount': -210,
    },
    {
      'username': 'user7',
      'last_trans': '21-03-2020',
      'amount': -290,
    },
    {
      'username': 'user8',
      'last_trans': '20-03-2020',
      'amount': -190,
    },
    {
      'username': 'user9',
      'last_trans': '10-03-2020',
      'amount': -28,
    },
  ];
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ((_youOweUsersList.length > 0) && (_usersOweYouList.length > 0))
        ? ListView(
            children: <Widget>[
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

  final _colorGreen = Color(0xFF41D9AE);
  final _colorRed = Color(0xFFBF395D);
  final _currencyFormat = NumberFormat.simpleCurrency(name: 'INR');

  double _getTotal() {
    double total = 0;
    userList.forEach((user) {
      total += user['amount'];
    });
    return total;
  }

  List<Widget> _buildList() {
    var _color = userOwesYou ? _colorGreen : _colorRed;
    List<Widget> lis = [
      ListTile(
        title: Text(
          userOwesYou ? 'You are due:' : 'You Owe :',
        ),
        trailing: Text(
          '${userOwesYou ? '+' : ''}${_currencyFormat.format(_getTotal())}',
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
          '${userOwesYou ? '+' : ''}${_currencyFormat.format(user['amount'])}',
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
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      color: Theme.of(context).canvasColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _buildList()),
    );
  }
}

// color: Color(0xFFBF395D),
