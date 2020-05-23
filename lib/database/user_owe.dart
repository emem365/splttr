class Outing {
  String userName;
  String date;
  String ofWhat;
  String fromUser;
  int amount;

  Outing(this.userName,this.date,this.fromUser,this.ofWhat,this.amount );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userName': userName,
      'date': date,
      'fromUser': fromUser,
      'amount':amount,
      'ofWhat':ofWhat
    };
    return map;
  }

  Outing.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    date = map['date'];
    fromUser = map['fromUser'];
    amount=map['amount'];
    ofWhat=map['ofWhat'];
  }
}
