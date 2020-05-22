import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/widgets/dialog-service.dart';
import 'package:intl/intl.dart';
import 'package:splttr/widgets/pack_avatar.dart';

class AddSplit extends StatefulWidget {
  @override
  _AddSplitState createState() => _AddSplitState();
}

class _AddSplitState extends State<AddSplit> {
  final _formKey = GlobalKey<FormState>();

  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');

  String _initialDate;
  TextEditingController _outingTitleController;

  TextEditingController _outingDescriptionController;

  TextEditingController _outingStartDateController;

  void _datePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    print(date);
    if (date == null) return;
    _outingStartDateController.text = _dateformat.format(date);
  }

  @override
  void initState() {
    super.initState();
    _outingTitleController = TextEditingController();
    _outingDescriptionController = TextEditingController();
    _outingStartDateController = TextEditingController();
    _initialDate = _dateformat.format(DateTime.now());
    _outingStartDateController.text = _initialDate;
  }

  @override
  void dispose() {
    _outingTitleController.dispose();
    _outingDescriptionController.dispose();
    _outingStartDateController.dispose();
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
                          'assets/images/outings-banner-light-purple.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            PickAvatar(
                              radius: MediaQuery.of(context).size.width / 6,
                              avatar: '',
                              onTap: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                ' Choose an avatar ',
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
                                onPressed: () async {
                                  var _title = _outingTitleController.text;
                                  var _description =
                                      _outingDescriptionController.text;
                                  var _date = _outingStartDateController.text;
                                  if (_title == '' &&
                                      _description == '' &&
                                      _date == _initialDate) {
                                    Navigator.of(context).pop();
                                    return;
                                  }
                                  DialogOptions response = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogBox(
                                          content: Text(
                                            'Do you want to discard changes?',
                                            textAlign: TextAlign.center,
                                          ),
                                          color: CurrencyColors.lossColor,
                                        );
                                      });
                                  if (response == DialogOptions.approve) {
                                    Navigator.of(context).pop();
                                  }
                                },
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
                  controller: _outingTitleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter a Title';
                    }
                    return null;
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Title',
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
                  controller: _outingDescriptionController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Description',
                    hintText: '(location, etc. - Optional)',
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
                  controller: _outingStartDateController,
                  readOnly: true,
                  onTap: () {
                    _datePicker(context);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Select a start date',
                  ),
                ),
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
                      print('process Data');
                    }
                  },
                  child: Text(
                    'Select Participants',
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