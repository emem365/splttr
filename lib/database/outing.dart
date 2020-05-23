class Outing {
  String outingName;
  String date;
  String place;

  Outing(this.outingName,this.date, this.place);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'outingName': outingName,
      'date': date,
      'place':place
    };
    return map;
  }

  Outing.fromMap(Map<String, dynamic> map) {
    outingName = map['outingName'];
    date = map['date'];
    place = map['place'];
  }
}
