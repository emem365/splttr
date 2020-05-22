import 'package:flutter/material.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/small_avatar_tile.dart';

class ChooseParticipantsByGroup extends StatefulWidget {
  @override
  _ChooseParticipantsByGroupState createState() =>
      _ChooseParticipantsByGroupState();
}

class _ChooseParticipantsByGroupState extends State<ChooseParticipantsByGroup> {
  List _groupsList = DummyData.groups;
  List<bool> _groupIsSelected;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    _groupIsSelected = List.filled(_groupsList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(Icons.check),
            label: Text('DONE'),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Select individually'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Groups',
                style: Theme.of(context).textTheme.headline4.apply(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: SmallAvatarTile(
                    avatar: _groupsList[index]['group-avatar'],
                    title: _groupsList[index]['group-name'],
                    subtitle: '${_groupsList[index]['members'].length} members',
                    onTap: () {},
                    actions: <Widget>[
                      Checkbox(
                        value: _groupIsSelected[index],
                        onChanged: (val) {
                          setState(() {
                            _groupIsSelected[index] = val;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
              childCount: _groupsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
