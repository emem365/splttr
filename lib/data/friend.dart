class Friend {
  String firstName;
  String lastName;
  String avatar;
  String username;

  Friend({
    this.firstName,
    this.lastName,
    this.avatar,
    this.username,
  });
  factory Friend.fromMap(Map friend){
    return Friend(
      firstName: friend['firstName'],
      lastName: friend['lastName'],
      username: friend['username'],
      avatar: friend['avatar'],
    );
  }
}
