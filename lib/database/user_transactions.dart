class Outing {
  String userName;
  String date;
  String paidFor;
  String mode;
  int amount;

  Outing(this.userName,this.date,this.mode,this.paidFor,this.amount );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userName': userName,
      'date': date,
      'mode': mode,
      'amount':amount,
      'paidFor':paidFor
    };
    return map;
  }

  Outing.fromMap(Map<String, dynamic> map) {
    userName = map['userName'];
    date = map['date'];
    mode = map['mode'];
    amount=map['amount'];
    paidFor=map['paidFor'];
  }
}
