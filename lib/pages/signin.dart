import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splttr/main.dart';
import 'package:splttr/res/slide_up_transition.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
    _getData().then((_) => Navigator.of(context)
        .pushReplacement(SlideUpRoute(widget: AppScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/banner.png'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        enabled: !_isProcessing,
                        controller: _usernameController,
                        validator: (value) {
                          final _allowedLetters =
                              "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!.-_";
                          if (value.isEmpty) {
                            return 'Please enter a username';
                          }
                          if (value.length > 32) {
                            return 'Enter a valid username';
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
                      Padding(
                        padding: EdgeInsets.only(top: 24.0, bottom: 8),
                        child: TextFormField(
                          enabled: !_isProcessing,
                          controller: _passwordController,
                          validator: (value) {
                            final _allowedLetters =
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!.-_@#\$%^&*?<>";
                            if (value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length > 32) {
                              return 'Enter a valid password';
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
                          obscureText: true,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Password',
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
                        padding: EdgeInsets.all(8),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'Create Account?',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                if (_formKey.currentState.validate()) {
                                  _processUserData(_usernameController.text,
                                      _passwordController.text);
                                }
                              },
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
