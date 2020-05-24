import 'package:flutter/material.dart';
import 'package:splttr/pages/pick_avatar_screen.dart';
import 'package:splttr/widgets/pick_avatar.dart';

class AddGroup extends StatefulWidget {
  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  final _formKey = GlobalKey<FormState>();

  String _groupAvatar = '';
  DateTime _dateOfCreation;
  TextEditingController _groupNameController;
  TextEditingController _groupDescriptionController;


  @override
  void initState() {
    super.initState();
    _groupNameController = TextEditingController();
    _groupDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
        _groupNameController.dispose();
    _groupDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                            PickAvatar(
                                radius: MediaQuery.of(context).size.width / 6,
                                avatar: _groupAvatar,
                                onTap: () async {
                                  _groupAvatar = await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PickAvatarScreen(),
                                    ),
                                  );
                                  setState((){});
                                },
                              ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ' Choose group avatar ',
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
                                onPressed: null,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: TextFormField(
                  controller: _groupNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Group Name';
                    }
                    return null;
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Group Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                // padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: _groupDescriptionController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Description',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Text('No friends in this group')
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 75,
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _dateOfCreation = DateTime.now();
                      print('process Data');
                    }
                  },                 
                  child: Text(
                    'Select members',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: StadiumBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}