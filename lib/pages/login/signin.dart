import 'package:flutter/material.dart';
import 'dart:async';
import 'package:splttr/pages/appscreen.dart';
import 'package:splttr/res/slide_transition.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:splttr/res/text_field_decoration.dart';
import 'package:splttr/res/validators.dart';
import 'package:splttr/widgets/flat_submit_button.dart';

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
    _getData().then((_) =>
        Navigator.of(context).pushReplacement(SlideRoute(widget: AppScreen())));
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Image(
                    image: AssetImage('assets/images/banner.png'),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    enabled: !_isProcessing,
                    controller: _usernameController,
                    validator: Validators.validateUserName,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Username',
                      hintText: 'What should we call you?',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    enabled: !_isProcessing,
                    controller: _passwordController,
                    cursorColor: Theme.of(context).primaryColor,
                    obscureText: true,
                    validator: (value){
                        if(Validators.validatePassword(value)!=null){
                            return Validators.validatePassword(value)
                        }
                        else  if(!validDetails){
                            validDetails = true;
                            return 'Invalid UserName or Password';
                          }
                          return null;
                        
                    }
                    
                    // validator: ,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Try to choose a strong password',
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          onPressed: _isProcessing ? null : () {},
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            'Forgot Password?',
                          ),
                        ),
                        FlatButton(
                          onPressed: _isProcessing
                              ? null
                              : () =>
                                  Navigator.of(context).pushNamed('/signup'),
                          textColor: Theme.of(context).primaryColor,
                          child: Text(
                            'Create Account?',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _isProcessing
                      ? JumpingDotsProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          dotSpacing: 1.0,
                          fontSize: 48,
                        )
                      : FlatSubmitButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _processUserData(_usernameController.text,
                                  _passwordController.text);
                            }
                          },
                          labelText: 'Submit',
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
