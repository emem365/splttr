class GroupPeople {
  String groupName;
  String member;

  GroupPeople(this.groupName,this.member);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'groupName': groupName,
      'member': member
    };
    return map;
  }

  GroupPeople.fromMap(Map<String, dynamic> map) {
    groupName = map['groupName'];
    member = map['member'];
  }
}
