import 'package:intl/intl.dart';
class User {
  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  DateTime dob;
  String avtar;

  User({
  this.firstName,
  this.lastName,
  this.dob,
  this.email,
  this.password,
  this.username,
  this.avtar
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'dob': dob.toString(),
      'avtar':avtar
    };
    return map;
  }
 final DateFormat _dateformat = DateFormat('yyyy-MM-dd');
  User.fromMap(Map<String, dynamic> map) {
    firstName = map['firstName'];
    lastName = map['lastName'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
    dob = _dateformat.parse(map['dob']);
    avtar= map['avtar'];
  }
  User.fromMapName(Map<String, dynamic> map) {
    // firstName = map['firstName'];
    // lastName = map['lastName'];
    username = map['username'];
    // email = map['email'];
    // password = map['password'];
    // dob = _dateformat.parse(map['dob']);
  }
  

}
