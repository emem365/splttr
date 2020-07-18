import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:splttr/data/user.dart';
import 'package:splttr/pages/pick_avatar_screen.dart';
import 'package:splttr/res/text_field_decoration.dart';
import 'package:splttr/res/validators.dart';
import 'package:splttr/widgets/flat_submit_button.dart';
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
  Future registerUser(User newuser) async {
    //register user
    await Future.delayed(Duration(seconds: 3));
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

  void processUserData() {
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
    );

    registerUser(newuser)
        .then((_) => Navigator.popUntil(context, ModalRoute.withName('/')));
  }

  bool checkUsernameExists(String value) {
    return false;
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
    const _sizedBoxSpace = SizedBox(height: 16);
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 100),
                  PickAvatar(
                    radius: MediaQuery.of(context).size.width / 6,
                    avatar: _avatar,
                    onTap: () async {
                      _avatar = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PickAvatarScreen(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  _sizedBoxSpace,
                  Text(
                    'Hi, ${widget.firstName}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  _sizedBoxSpace,
                  _sizedBoxSpace,
                  Text(
                    'Please select a username and password',
                  ),
                  _sizedBoxSpace,
                  _sizedBoxSpace,
                  TextFormField(
                    enabled: !_isProcessing,
                    controller: _usernameController,
                    validator: Validators.validateUserName,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'UserName',
                      hintText: 'What do you want us to call you?',
                    ),
                  ),
                  _sizedBoxSpace,
                  TextFormField(
                    enabled: !_isProcessing,
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Theme.of(context).primaryColor,
                    validator: Validators.validatePassword,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.lock_open),
                      labelText: 'Password',
                    ),
                  ),
                  _sizedBoxSpace,
                  TextFormField(
                    enabled: !_isProcessing,
                    controller: _repasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text)
                        return 'Passwords don\'t match';
                      return null;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.lock_open),
                      labelText: 'Re-enter Password',
                    ),
                  ),
                  _sizedBoxSpace,
                  _sizedBoxSpace,
                  _isProcessing
                      ? JumpingDotsProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          dotSpacing: 1.0,
                          fontSize: 48,
                        )
                      : FlatSubmitButton(
                          onPressed: () {
                            if (_formKey.currentState.validate())
                              processUserData();
                          },
                          labelText: 'Register',
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
