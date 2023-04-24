import 'package:alfie/models/group.dart';
import 'package:alfie/repositories/database.dart';

class GroupRepository {
  GroupRepository._privateConstructor();
  static final GroupRepository instance = GroupRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _groupsTableName = 'groups';

  Future<List<Group>> getGroups() async {
    var db = await _databaseHelper.database;
    return await db.query(_groupsTableName).then((value) => value.map((e) => Group.fromMap(e)).toList(growable: false));
  }

  Future<void> createGroup(Group group) async {
    var db = await _databaseHelper.database;
    await db.insert(_groupsTableName, group.toMap());
  }

  Future<void> updateGroup(Group group) async {
    var db = await _databaseHelper.database;
    await db.update(_groupsTableName, group.toMap(), where: 'id = ?', whereArgs: [group.id]);
  }

  Future<void> deleteGroup(int id) async {
    var db = await _databaseHelper.database;
    await db.delete(_groupsTableName, where: 'id = ?', whereArgs: [id]);
  }
}
