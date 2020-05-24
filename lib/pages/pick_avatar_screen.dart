import 'package:flutter/material.dart';
import 'package:splttr/res/avatars.dart';

class PickAvatarScreen extends StatefulWidget {
  @override
  _PickAvatarScreenState createState() => _PickAvatarScreenState();
}

class _PickAvatarScreenState extends State<PickAvatarScreen> {
  int selectedAvatarIndex;

  @override
  void initState() {
    super.initState();
  }

  Widget buildAvatar(BuildContext context, int index) => SizedBox.expand(
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
                color: index == selectedAvatarIndex
                    ? Theme.of(context).accentColor
                    : Colors.grey,
                width: index == selectedAvatarIndex ? 5.0 : 0.5,
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
                    child: Avatars.getAssetFromName(Avatars.avatarList[index]),
                  ),
                  Text(
                    Avatars.avatarList[index][0].toUpperCase() +
                        Avatars.avatarList[index].substring(1).toLowerCase(),
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            setState(() {
              if (selectedAvatarIndex == index) {
                selectedAvatarIndex = null;
              } else {
                selectedAvatarIndex = index;
              }
            });
          },
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Select Avatar'),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(Icons.check),
            label: Text('Select'),
            onPressed: () {
              Navigator.pop(
                  context,
                  selectedAvatarIndex != null
                      ? Avatars.avatarList[selectedAvatarIndex]
                      : '');
            },
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 5,
          ),
          itemCount: Avatars.avatarList.length,
          itemBuilder: buildAvatar,
        ),
      ),
    );
  }
}
