import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splttr/pages/login/register_user.dart';
import 'package:splttr/res/text_field_decoration.dart';
import 'package:splttr/res/validators.dart';
import 'package:splttr/widgets/flat_submit_button.dart';

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
    const SizedBox _sizedBoxSpace = SizedBox(height: 20);
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                  _sizedBoxSpace,
                  _sizedBoxSpace,
                  _sizedBoxSpace,
                  TextFormField(
                    controller: _firstNameController,
                    validator: Validators.validateFirstName,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'First Name',
                      hintText: 'What do people call you?',
                    ),
                  ),
                  _sizedBoxSpace,
                  TextFormField(
                    controller: _lastNameController,
                    validator: Validators.validateLastName,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Last Name',
                      hintText: 'Family Name',
                    ),
                  ),
                  _sizedBoxSpace,
                  TextFormField(
                    controller: _emailController,
                    validator: Validators.validateEmail,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Email',
                      hintText: 'Where can we reach you?',
                    ),
                  ),
                  _sizedBoxSpace,
                  TextFormField(
                    readOnly: true,
                    onTap: () {
                      _datePicker(context);
                    },
                    controller: _dateController,
                    validator: Validators.validateDate,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: TextFieldDecoration.circularBorderDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Date of Birth',
                    ),
                  ),
                  _sizedBoxSpace,
                  FlatSubmitButton(
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        _processUserData(context);
                    },
                    labelText: 'Next',
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
