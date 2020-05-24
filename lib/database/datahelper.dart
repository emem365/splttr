import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:splttr/database/user.dart';

class DBHelper {
  static Database _db;
  static const String DB_NAME = 'splttr.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE Users (username VARCHAR PRIMARY KEY, firstName TEXT, lastName TEXT, password VARCHAR, mobile INTEGER, email VARCHAR, dob VARCHAR )");
    await db.execute("CREATE TABLE Groups (groupName VARCHAR PRIMARY KEY, doc VARCHAR)");
    await db.execute("CREATE TABLE Outings (outingName VARCHAR PRIMARY KEY, date VARCHAR, place VARCHAR)");
    await db.execute("CREATE TABLE Group_members (groupName VARCHAR, member VARCHAR,FOREIGN KEY(groupName) REFERENCES Groups(groupName),FOREIGN KEY(member) REFERENCES Users(userName))");
    await db.execute("CREATE TABLE Group_outings (groupName VARCHAR, outingName VARCHAR, FOREIGN KEY(groupName) REFERENCES Groups(groupName), FOREIGN KEY(outingName) REFERENCES Outings(outingName))");
    await db.execute("CREATE TABLE Outing_transictions (outingName VARCHAR, userName VARCHAR, mode VARCHAR, amount INTEGER, paidFor VARCHAR, FOREIGN KEY(userName) REFERENCES Users(userName), FOREIGN KEY(outingName) REFERENCES Outings(outingName))");
    await db.execute("CREATE TABLE user_transictions (userName VARCHAR, date VARCHAR, mode VARCHAR, amount INTEGER, paidFor VARCHAR, FOREIGN KEY(userName) REFERENCES Users(userName))");
    await db.execute("CREATE TABLE user_owe (userName VARCHAR, date VARCHAR, ofWhat VARCHAR, fromUser VARCHAR, amount INTEGER, FOREIGN KEY(userName) REFERENCES Users(userName), FOREIGN KEY(fromUser) REFERENCES Users(userName))");


        
  }

  Future<User> save(User user) async {
    var dbClient = await db;
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
    var dbClient = await db;
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
    var dbClient = await db;
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
    var dbClient = await db;
    // await dbClient.transaction((txn) async {
    //   var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + user.name + "')";
    //   return await txn.rawInsert(query);

  List<Map> result = await dbClient.rawQuery('SELECT * FROM Users WHERE userName=?', [userName]);

    // print the results
    var a;
    result.forEach((row) => a = User.fromMap(row).password);
    return a;

  }
  // Future<int> delete(int id) async {
  //   var dbClient = await db;
  //   return await dbClient.delete('Users', where: 'id = ?', whereArgs: [id]);
  // }

  // Future<int> update(User user) async {
  //   var dbClient = await db;
  //   return await dbClient.update('Users', user.toMap(),
  //       where: 'id = ?', whereArgs: [user.id]);
  // }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
