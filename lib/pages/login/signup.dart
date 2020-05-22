import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/login/register_user.dart';

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
                  image: AssetImage('assets/images/banner.png'),
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
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.";
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
                          readOnly: true,
                          onTap: () {
                            _datePicker(context);
                          },
                          controller: _dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a Date';
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
