import 'package:flutter/material.dart';
import 'package:splttr/res/resources.dart';

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
          child: Tile(
            avatar: 'travel-bag',
            title: 'Goa Trip',
            body: 'with Akhilesh, Dharma and 3 others',
            subtitle: '14/08/2022',
          ),
        ),
      ],
    );
  }
}
