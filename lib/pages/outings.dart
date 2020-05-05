import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';
import 'package:intl/intl.dart';

class Outings extends StatefulWidget {
  @override
  _OutingsState createState() => _OutingsState();
}

class _OutingsState extends State<Outings> with AutomaticKeepAliveClientMixin {
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');
  List _outingsList = DummyData.outingsList;

  @override
  bool get wantKeepAlive => true;

  String _createBodyForTile(List<String> friendsList) {
    switch (friendsList.length) {
      case 0:
        return '';
      case 1:
        return 'with ${friendsList[0]}';
      case 2:
        return 'with ${friendsList[0]} and ${friendsList[1]}';
      case 3:
        return 'with ${friendsList[0]}, ${friendsList[1]} and ${friendsList[2]}';
      default:
        return 'with ${friendsList[0]}, ${friendsList[1]} and ${friendsList.length - 2} others';
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: _outingsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0)
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(32),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Image.asset(
                      'images/outings.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Outings',
                  style: Theme.of(context).textTheme.headline.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
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
                            'Add Group',
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
                          onPressed: () {},
                          child: Text(
                            'Add Outing',
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
              ],
            ),
          );
        index--;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: Tile(
              avatar: _outingsList[index]['avatar'],
              title: _outingsList[index]['outing-name'],
              body: _createBodyForTile(_outingsList[index]['friends']),
              subtitle: _dateformat.format(_outingsList[index]['date']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => OutingPage(
                      name: _outingsList[index]['outing-name'],
                      avatar: _outingsList[index]['avatar'],
                    ),
                  ),
                );
              },
              backgroundColor: PurpleTheme.blue,
              splashColor: Theme.of(context).splashColor),
        );
      },
    );
  }
}

class OutingPage extends StatefulWidget {
  final String name;
  final String avatar;
  OutingPage({this.name, this.avatar});
  @override
  _OutingPageState createState() => _OutingPageState();
}

class _OutingPageState extends State<OutingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.edit,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.solidTrashAlt,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.width / 3 + 200,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/outings-banner-light-purple.png',
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: widget.name,
                              child: CircleAvatar(
                                child: Avatars.getAssetFromName(widget.avatar),
                                radius: MediaQuery.of(context).size.width / 6,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ' ${widget.name} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(
                                      fontFamily: 'Montserrat',
                                      backgroundColor: Colors.white54,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBarWithBackground(
                    tabBar: TabBar(
                      indicatorColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.black,
                      labelStyle: Theme.of(context).textTheme.headline.copyWith(
                            fontSize: 14,
                          ),
                      tabs: [
                        Tab(
                          text: 'Expenses',
                        ),
                        Tab(
                          text: 'Settlements',
                        ),
                        Tab(
                          text: 'Participants',
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white54,
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                OutingExpensesTab(),
                OutingSettlementsTab(),
                OutingParticipantsTab(),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: PurpleTheme.lightPurple,
            onPressed: () {},
            icon: Icon(
              Icons.add,
            ),
            label: Text(
              'Add Expense',
              style: Theme.of(context).textTheme.button.copyWith(
                    letterSpacing: 1.0,
                    fontSize: 14.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutingExpensesTab extends StatefulWidget {
  @override
  _OutingExpensesTabState createState() => _OutingExpensesTabState();
}

class _OutingExpensesTabState extends State<OutingExpensesTab> {
  List<Map> _outingExpensesList = DummyData.outingExpensesList;
  String _createBodyForTile(List<String> friendsList) {
    switch (friendsList.length) {
      case 0:
        return '';
      case 1:
        return '${friendsList[0]}';
      case 2:
        return '${friendsList[0]} and ${friendsList[1]}';
      case 3:
        return '${friendsList[0]}, ${friendsList[1]} and ${friendsList[2]}';
      default:
        return '${friendsList[0]}, ${friendsList[1]} and ${friendsList.length - 2} others';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _outingExpensesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: SmallAvatarTile(
              avatar: _outingExpensesList[index]['spent-by-avatar'],
              title: _outingExpensesList[index]['spent-on'],
              subtitle:
                  'Amount: ${Currency.currencyFormat.format(_outingExpensesList[index]['amount'])}',
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.edit,
                    size: 20,
                  ),
                  onPressed: () => print('edit'),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trashAlt,
                    size: 20,
                  ),
                  onPressed: () => print('trash'),
                ),
              ],
              onTap: () => print('tile'),
            ),
          );
        },
      ),
    );
  }
}

class OutingSettlementsTab extends StatefulWidget {
  @override
  _OutingSettlementsTabState createState() => _OutingSettlementsTabState();
}

class _OutingSettlementsTabState extends State<OutingSettlementsTab> {
  List<Map> _outingSettlementsList = DummyData.outingSettlementsList;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _outingSettlementsList.length + 1,
        itemBuilder: (_, index) {
          if (index == 0) {
            return FlatButton(
              onPressed: () {},
              child: Text(
                'Add your share to your expenses? Click here!',
                style: TextStyle(
                  color: PurpleTheme.darkPurple,
                ),
              ),
            );
          }
          index--;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Card(
              color: PurpleTheme.blue,
              child: Container(
                height: 125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          child: Avatars.getAssetFromName(
                              _outingSettlementsList[index]['from-avatar']),
                        ),
                        Icon(FontAwesomeIcons.arrowRight),
                        CircleAvatar(
                          radius: 30,
                          child: Avatars.getAssetFromName(
                              _outingSettlementsList[index]['to-avatar']),
                        ),
                      ],
                    ),
                    Text(
                      '${_outingSettlementsList[index]['from']} gives ${Currency.currencyFormat.format(_outingSettlementsList[index]['amount'])} to ${_outingSettlementsList[index]['to']}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class OutingParticipantsTab extends StatefulWidget {
  @override
  _OutingParticipantsTabState createState() => _OutingParticipantsTabState();
}

class _OutingParticipantsTabState extends State<OutingParticipantsTab> {
  List<Map> _participantsList = DummyData.outingParticipantList;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: _participantsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: SmallAvatarTile(
              avatar: _participantsList[index]['avatar'],
              title: _participantsList[index]['username'],
              subtitle:
                  'Spent: ${Currency.currencyFormat.format(_participantsList[index]['spent'])}',
              actions: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.trashAlt),
                  onPressed: () => print('trash'),
                ),
              ],
              onTap: () => print('tile'),
            ),
          );
        },
      ),
    );
  }
}
