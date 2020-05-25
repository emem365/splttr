import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:splttr/dataPages/user.dart';
import 'package:splttr/database/userQuery.dart';
import 'package:splttr/pages/pick_avatar_screen.dart';
import 'package:splttr/widgets/pick_avatar.dart';

class RegisterUser extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime dob;

  RegisterUser({
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  });

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  var dbHelper;
  var users;
  bool validUserName = true;
  Future registerUser(User newuser) async {
    dbHelper.save(newuser);
    // users.forEach((user)=> print(user));
    // await Future.delayed(Duration(seconds: 3));
  }

  Future<List> getUserNames() async {
    var userNames = await dbHelper.getUserNames();
    return userNames;
  }

  bool _isProcessing;
  final _formKey = GlobalKey<FormState>();
  String _avatar = '';
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  TextEditingController _repasswordController;

  @override
  void initState() {
    super.initState();
    dbHelper = UserQuery();
    _usernameController = new TextEditingController();
    _passwordController = new TextEditingController();
    _repasswordController = new TextEditingController();
    _isProcessing = false;
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
  }

  void processUserData() async {
    validUserName = await checkUsernameExists(_usernameController.text);
    if (!validUserName) {
      setState(() {
        _isProcessing = false;
        validUserName = false;
        _formKey.currentState.validate();
      });
    } else {
      setState(() {
        _isProcessing = true;
      });
      User newuser = User(
        firstName: widget.firstName,
        lastName: widget.lastName,
        email: widget.email,
        dob: widget.dob,
        username: _usernameController.text,
        password: _passwordController.text,
        avtar: _avatar,
      );

      registerUser(newuser)
          .then((_) => Navigator.popUntil(context, ModalRoute.withName('/')));
    }
  }

  Future<bool> checkUsernameExists(String value) async {
    var userNames = await getUserNames();
    if (!userNames.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 16,),
                child:  PickAvatar(
                                radius: MediaQuery.of(context).size.width / 6,
                                avatar: _avatar,
                                onTap: () async {
                                  _avatar = await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PickAvatarScreen(),
                                    ),
                                  );
                                  setState((){});
                                },
                              ),
              ),
              Text(
                'Hi, ${widget.firstName}',
                style: Theme.of(context).textTheme.headline5,
              ),
              Padding(padding: EdgeInsets.only(top: 32.0)),
              Text(
                'Please select a username',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          enabled: !_isProcessing,
                          controller: _usernameController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!.-_";
                            if (value.isEmpty) {
                              return 'Please enter a username';
                            }
                            if (value.length > 32) {
                              return 'Too long';
                            }
                            if (value[0].toUpperCase() == value[0]) {
                              return 'Username cannot start with Uppercase Character';
                            }
                            if (value[0] == '!' ||
                                value[0] == '.' ||
                                value[0] == '-' ||
                                value[0] == '_') {
                              return 'Username cannot start with ${value[0]}';
                            }
                            var lis = value.split('');
                            for (String char in lis) {
                              if (!(_allowedLetters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            if (!validUserName) {
                              validUserName = true;

                              return 'Already exists. Try something else';
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextFormField(
                          enabled: !_isProcessing,
                          controller: _passwordController,
                          obscureText: true,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Enter a password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextFormField(
                          enabled: !_isProcessing,
                          controller: _repasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value != _passwordController.text)
                              return 'Passwords don\'t match';
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Re - enter Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                      ),
                      _isProcessing
                          ? JumpingDotsProgressIndicator(
                              color: Theme.of(context).primaryColor,
                              dotSpacing: 1.0,
                              fontSize: 48,
                            )
                          : FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 75),
                              onPressed: () {
                                if (_formKey.currentState.validate())
                                  processUserData();
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Theme.of(context).primaryColor,
                              shape: StadiumBorder(),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
