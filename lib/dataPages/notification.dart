class Notification {
  String userName;
  String from;
  String type;
  String details;

  Notification({
  this.userName,
  this.from,
  this.type,
  this.details
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userName': userName,
      'from': from,
      'type':type,
      'details':details
    };
    return map;
  }
  Notification.fromMap(Map<String, dynamic> map) {
    userName = map['firstName'];
    from = map['from'];
    type = map['type'];
    details = map['details'];
  }
}
