class Friends {
  String userName;
  String friend;

  Friends({
  this.userName,
  this.friend,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userName': userName,
      'friend': friend,
    };
    return map;
  }
  Friends.fromMap(Map<String, dynamic> map) {
    userName = map['firstName'];
    friend = map['friend'];
  }
}
