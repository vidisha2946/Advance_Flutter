import 'package:crud/Lab_3/db/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserControllerwithdb {
  final List<UserModelDB> _userList = [];
  late Database db;

  Future<void> initDatabase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'person.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE student(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT
          )
        ''');
      },
    );
    print("Database Initialized");
  }

  List<UserModelDB> get getUser => _userList;

  Future<void> addUser(UserModelDB user) async {
    await db.insert('student', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    await displayUser();
  }

  Future<void> deleteUser(UserModelDB user) async {
    await db.delete('student', where: 'id = ?', whereArgs: [user.id]);
    await displayUser();
  }

  Future<void> deleteAll() async {
    await db.delete('student');
    _userList.clear();
  }

  Future<void> editUser(UserModelDB user) async {
    await db.update('student', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    await displayUser();
  }

  Future<void> displayUser() async {
    final List<Map<String, dynamic>> usersMap = await db.query('student');
    _userList.clear();
    _userList.addAll(usersMap.map((e) => UserModelDB.fromMap(e)).toList());
  }
}
