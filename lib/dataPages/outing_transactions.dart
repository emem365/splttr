class Outing {
  String outingName;
  String userName;
  String paidFor;
  String mode;
  int amount;

  Outing({this.outingName,this.mode, this.userName, this.amount, this.paidFor});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'outingName': outingName,
      'userName':userName,
      'mode': mode,
      'amount':amount,
      'paidFor':paidFor
    };
    return map;
  }

  Outing.fromMap(Map<String, dynamic> map) {
    outingName = map['outingName'];
    userName = map['userName'];
    mode = map['mode'];
    amount=map['amount'];
    paidFor=map['paidFor'];
  }
}
