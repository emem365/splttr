import 'package:flutter/material.dart';
import 'package:splttr/pages/choose_participants_by_group.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/dummy_data.dart';

class ChooseParticipants extends StatefulWidget {
  final bool enableSelectionByGroup;
  ChooseParticipants({this.enableSelectionByGroup});
  @override
  _ChooseParticipantsState createState() => _ChooseParticipantsState();
}

class _ChooseParticipantsState extends State<ChooseParticipants> {
  List _friendsList = DummyData.friends;
  List<bool> _friendIsSelected;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    _friendIsSelected = List.filled(_friendsList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton _floatingActionButton =
        (widget.enableSelectionByGroup == true)
            ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseParticipantsByGroup()),
                  );
                },
                label: Text('Select By Group'),
              )
            : null;
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
      floatingActionButton: _floatingActionButton,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Friends',
                style: Theme.of(context).textTheme.headline4.apply(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 4 / 5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SizedBox.expand(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.5, 0.5),
                                blurRadius: 0.2),
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: _friendIsSelected[index]
                                ? Theme.of(context).accentColor
                                : Colors.grey,
                            width: _friendIsSelected[index] ? 5.0 : 0.5,
                          ),
                        ),
                        child: SizedBox(
                          width: 125,
                          height: 175,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 50,
                                child: Avatars.getAssetFromName(
                                    _friendsList[index]['avatar']),
                              ),
                              Text(
                                '@' + _friendsList[index]['username'],
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _friendIsSelected[index] =
                              !(_friendIsSelected[index]);
                        });
                      },
                    ),
                  );
                },
                childCount: _friendsList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
