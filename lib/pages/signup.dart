import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splttr/main.dart';
import 'package:splttr/res/slide_transition.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Future _getData() async {
    await Future.delayed(Duration(seconds: 3));
  }

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isProcessing;

  @override
  void initState() {
    super.initState();
    _isProcessing = false;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _processUserData(String username, String password) {
    print('Check username and password');
    print('$username and $password');
    print('If valid load new page');
    setState(() {
      _isProcessing = true;
    });
    _getData().then((_) =>
        Navigator.of(context).pushReplacement(SlideRoute(widget: AppScreen())));
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
                style: Theme.of(context).textTheme.headline,
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
                          enabled: !_isProcessing,
                          // controller: _firstNameController,
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
                          enabled: !_isProcessing,
                          // controller: _lastNameController,
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
                          enabled: !_isProcessing,
                          // controller: _emailController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                            final _specialCharacters = "!#\$%&'*+-/=?^_`{|}~";
                            if (value.length > 32) {
                              return 'Enter a valid email';
                            }
                            var parts = value.split('@');
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
                          enabled: !_isProcessing,
                          // onTap: _selectDate(),
                          // controller: _dateController,
                          validator: (value) {
                            final _allowedLetters = "0123456789-";
                            if (value.length > 10) {
                              return 'Enter a valid Date';
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
                      _isProcessing
                          ? JumpingDotsProgressIndicator(
                              color: Theme.of(context).primaryColor,
                              dotSpacing: 1.0,
                              fontSize: 48,
                            )
                          : FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 75),
                              onPressed: () {},
                              child: Text(
                                'Submit',
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
