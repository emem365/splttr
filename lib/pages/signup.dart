import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:intl/intl.dart';
import 'package:splttr/res/user.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _datePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    _dateController.text = _dateformat.format(date);
  }

  void _processUserData(BuildContext context) {
    print('Processing Data');
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String date = _dateController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterUser(
          firstName: firstName,
          lastName: lastName,
          email: email,
          dob: _dateformat.parse(date),
        ),
      ),
    );
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
                padding: EdgeInsets.only(top: 48, bottom: 16),
                child: Image(
                  image: AssetImage('images/banner.png'),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                ),
              ),
              Text(
                'Sign-up',
                style: Theme.of(context).textTheme.headline5,
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
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextFormField(
                          controller: _firstNameController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                            if (value.isEmpty) {
                              return 'Please enter a Name';
                            }
                            if (value.length > 32) {
                              return 'Enter a valid Name';
                            }
                            var lis = value.split('');
                            for (String char in lis) {
                              if (!(_allowedLetters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'First Name',
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
                          controller: _lastNameController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                            if (value.length > 32) {
                              return 'Enter a valid Name';
                            }
                            var lis = value.split('');
                            for (String char in lis) {
                              if (!(_allowedLetters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Last Name',
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
                          controller: _emailController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                            final _specialCharacters = "!#\$%&'*+-/=?^_`{|}~";
                            if (value.isEmpty) {
                              return 'Please enter a Date';
                            }
                            if (value.length > 32) {
                              return 'Enter a valid email';
                            }
                            var parts = value.split('@');
                            if (parts.length != 2) return 'Invalid email';
                            var localList = parts[0].split('');
                            var domainList = parts[1].split('');
                            for (String char in localList) {
                              if (!(_allowedLetters.contains(char) ||
                                  _specialCharacters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            for (String char in domainList) {
                              if (!(_allowedLetters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Email Name',
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
                          onTap: () {
                            _datePicker(context);
                          },
                          controller: _dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a Date';
                            }
                            final _allowedLetters = "0123456789/";
                            if (value.length > 10) {
                              return 'Enter a valid Date';
                            }
                            var lis = value.split('');
                            for (String char in lis) {
                              if (!(_allowedLetters.contains(char))) {
                                return 'Illegal letters present';
                              }
                            }
                            try {
                              DateTime date = _dateformat.parse(value);
                              print(date);
                            } catch (e) {
                              return 'Invalid Date';
                            }
                            return null;
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Date of Birth',
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
                        padding: EdgeInsets.all(16),
                      ),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 75),
                        onPressed: () {
                          if (_formKey.currentState.validate())
                            _processUserData(context);
                        },
                        child: Text(
                          'Next',
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
  void dispose(){
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
  }

  void processUserData() {
    setState((){
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
                padding: EdgeInsets.only(top: 48, bottom: 16),
                child: Image(
                  image: AssetImage('images/banner.png'),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
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
                            if (checkUsernameExists(value))
                              return 'Already exists. Try something else';
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
