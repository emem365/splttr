class Group {
  String groupName;
  String doc;

  Group({this.groupName,this.doc});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'groupName': groupName,
      'doc': doc
    };
    return map;
  }

  Group.fromMap(Map<String, dynamic> map) {
    groupName = map['groupName'];
    doc = map['doc'];
  }
}
