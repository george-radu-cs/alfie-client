import 'package:alfie/models/user.dart';
import 'package:alfie/repositories/database.dart';

class UsersRepository {
  UsersRepository._privateConstructor();
  static final UsersRepository instance = UsersRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _usersTableName = 'users';
  final int _userId = 1;

  Future<User> getUser() async {
    var db = await _databaseHelper.database;
    return await db.query(_usersTableName).then((value) => User.fromMap(value.first));
  }

  Future<void> updateUser(User user) async {
    var db = await _databaseHelper.database;
    await db.update(_usersTableName, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<void> updateToken(String? token) async {
    var db = await _databaseHelper.database;
    await db.update(_usersTableName, {'token': token}, where: 'id = ?', whereArgs: [_userId]);
  }
}
