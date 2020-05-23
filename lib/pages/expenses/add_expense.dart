import 'package:flutter/material.dart';
import 'package:splttr/res/colors.dart';
import 'package:splttr/widgets/dialog-service.dart';
import 'package:intl/intl.dart';
import 'package:splttr/widgets/pick_avatar.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  final DateFormat _dateformat = DateFormat('dd/MM/yyyy');

  String _initialDate;
  TextEditingController _expenseTitleController;

  TextEditingController _expenseDescriptionController;

  TextEditingController _expenseStartDateController;

  TextEditingController _expenseAmountController;

  void _datePicker(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    print(date);
    if (date == null) return;
    _expenseStartDateController.text = _dateformat.format(date);
  }

  @override
  void initState() {
    super.initState();
    _expenseTitleController = TextEditingController();
    _expenseDescriptionController = TextEditingController();
    _expenseStartDateController = TextEditingController();
    _expenseAmountController = TextEditingController();
    _initialDate = _dateformat.format(DateTime.now());
    _expenseStartDateController.text = _initialDate;
  }

  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseDescriptionController.dispose();
    _expenseStartDateController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() async {
    var _title = _expenseTitleController.text;
    var _description = _expenseDescriptionController.text;
    var _date = _expenseStartDateController.text;
    var _amount = _expenseAmountController.text;
    if (_title == '' &&
        _description == '' &&
        _amount == '' &&
        _date == _initialDate) {
      return true;
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
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
                            'assets/images/expenses-banner.png',
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
                                  ' Choose an avatar for expense ',
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
                                  onPressed: () => Navigator.maybePop(context),
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
                    controller: _expenseTitleController,
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
                    controller: _expenseDescriptionController,
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
                    controller: _expenseAmountController,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please add the amount";
                      }
                      try {
                        int.parse(value);
                      } catch (ex) {
                        return 'Only Numeral characters allowed';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Enter Amount',
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
                    controller: _expenseStartDateController,
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
                      'Add Expense',
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
      ),
    );
  }
}
