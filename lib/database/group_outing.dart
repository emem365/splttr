class GroupOuting {
  String groupName;
  String outingName;

  GroupOuting(this.groupName,this.outingName);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'groupName': groupName,
      'outingName': outingName
    };
    return map;
  }

  GroupOuting.fromMap(Map<String, dynamic> map) {
    groupName = map['groupName'];
    outingName = map['outingName'];
  }
}
