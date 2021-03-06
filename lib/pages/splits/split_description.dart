import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/widgets/tab_bar_with_background.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/pages/splits/split_expenses_tab.dart';
import 'package:splttr/pages/splits/split_settlements_tab.dart';
import 'package:splttr/pages/splits/split_participants_tab.dart';

class SplitPage extends StatefulWidget {
  final String tag;
  final String name;
  final String avatar;
  SplitPage({this.tag, this.name, this.avatar});
  @override
  _SplitPageState createState() => _SplitPageState();
}

class _SplitPageState extends State<SplitPage> {
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
                          'assets/images/outings-banner-light-purple.png',
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: widget.tag,
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
                                    .headline5
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
                      labelStyle: Theme.of(context).textTheme.headline5.copyWith(
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
                SplitExpensesTab(),
                SplitSettlementsTab(),
                SplitParticipantsTab(),
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
