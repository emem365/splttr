import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';

class Outings extends StatefulWidget {
  @override
  _OutingsState createState() => _OutingsState();
}

class _OutingsState extends State<Outings> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: PurpleTheme.lightPurple,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Avatars.getAssetFromName('travel-bag'),
                    radius: MediaQuery.of(context).size.width/8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
