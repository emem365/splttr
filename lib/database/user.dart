import 'package:intl/intl.dart';
class User {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  DateTime dob;

  User({this.id,
  this.firstName,
  this.lastName,
  this.dob,
  this.email,
  this.password,
  this.username
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id':id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'dob': dob.toString()
    };
    return map;
  }
 final DateFormat _dateformat = DateFormat('yyyy-MM-dd');
  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
    dob = _dateformat.parse(map['dob']);
    // dob = map['dob'].parse(DateTime);
  }
}
