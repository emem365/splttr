import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/currency.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/res/resources.dart';
import 'package:intl/intl.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> with AutomaticKeepAliveClientMixin {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: 1,
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
                      'images/friends.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Friends',
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
                            'Add group',
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
                            'Add friend',
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
        return null;
      },
    );
  }
}
