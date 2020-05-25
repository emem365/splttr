import 'package:splttr/dataPages/user.dart';
import 'datahelper.dart';
  class UserQuery
    {var data = DBHelper();
  Future<User> save(User user) async {
    var dbClient = await data.db;
    await dbClient.insert('Users', user.toMap());
    return user;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + user.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<User>> getUsers() async {
    var dbClient = await data.db;
    // List<Map> maps = await dbClient.query('Users', columns: ['id', 'username']);
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM Users");
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.fromMap(maps[i]));
      }
    }
    return users;
  }

  Future<List<String>> getUserNames() async {
    var dbClient = await data.db;
    // List<Map> userNames = await dbClient.query('Users', columns: ['username']);
    List<Map> userNames = await dbClient.rawQuery("SELECT * FROM Users");
    List<String> userName = [];
    if (userNames.length > 0) {
      for (int i = 0; i < userNames.length; i++) {
        userName.add(User.fromMap(userNames[i]).username);
      }
    }
    return userName;
  }
  Future<String> checkPass(String userName) async {
    var dbClient = await data.db;
  List<Map> result = await dbClient.rawQuery('SELECT * FROM Users WHERE userName=?', [userName]);
    var a;
    result.forEach((row) => a = User.fromMap(row).password);
    return a;
  }
  Future<User> userDetails(String userName) async {
    var dbClient = await data.db;
  List<Map> result = await dbClient.rawQuery('SELECT * FROM Users WHERE userName=?', [userName]);
    var a;
    result.forEach((row) => a = User.fromMap(row));
    return a;
  }
  
}