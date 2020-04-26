import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
    );
  }
}

class OutingSettlementsTab extends StatefulWidget {
  @override
  _OutingSettlementsTabState createState() => _OutingSettlementsTabState();
}

class _OutingSettlementsTabState extends State<OutingSettlementsTab> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: PurpleTheme.blue,
              child: Column(
                children: List.generate(
                  _participantsList.length * 2,
                  (int index) {
                    if (index % 2 == 0)
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Avatars.getAssetFromName(
                                  _participantsList[index ~/ 2]['avatar'])),
                          title:
                              Text(_participantsList[index ~/ 2]['username']),
                          subtitle: Text(
                              'spent: ${Currency.currencyFormat.format(_participantsList[index ~/ 2]['spent'])}'),
                          onTap: () {},
                        ),
                      );
                    else
                      return Divider();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
