import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splttr/pages/pick_avatar_screen.dart';
import 'package:splttr/res/avatars.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/res/dummy_data.dart';
import 'package:splttr/widgets/pick_avatar.dart';

class ViewGroup extends StatelessWidget {
  final List _membersList = DummyData.friends.sublist(0, 5);
  List<Widget> _buildList() {
    List<Widget> lis = [
      ListTile(
        title: Text(
          'Members',
        ),
        trailing: Text(
          '6',
        ),
      ),
      Divider(),
    ];
    _membersList.forEach((member) {
      lis.add(
        ListTile(
          leading: CircleAvatar(
            child: Avatars.getAssetFromName(member['avatar']),
          ),
          title: Text(
            '${member['username']}',
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
          ),
        ),
      );
      lis.add(Divider());
    });
    return lis;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: PurpleTheme.lightPurple,
        onPressed: () {},
        icon: Icon(
          Icons.add,
        ),
        label: Text(
          'Add members',
          style: Theme.of(context).textTheme.button.copyWith(
                letterSpacing: 1.0,
                fontSize: 14.0,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width / 3 + 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/friends-banner.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 6,
                            child: Avatars.getAssetFromName('ghost'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              ' Group Name ',
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
                      SafeArea(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Spacer(),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: FlatButton(onPressed: (){}, child: Text('View all splits with Group Name'), textColor: Theme.of(context).primaryColor,),
            ),
            Card(
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
            ),
          ],
        ),
      ),
    );
  }
}
