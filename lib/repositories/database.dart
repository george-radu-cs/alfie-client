import 'dart:io';
import 'package:alfie/models/user.dart';
import 'package:alfie/repositories/users_repository.dart';
import 'package:alfie/services/logger_service.dart';
import 'package:alfie/services/permissions_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:alfie/repositories/migrations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:http/http.dart' as http;

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  static const String _databaseName = "alfie.db";
  static const String _databaseBackupName = "alfie_backup.db";

  Future<String> _getInternalDatabasePath() async {
    String dbFolder = await getDatabasesPath();
    String databasePath = join(dbFolder, _databaseName);
    return databasePath;
  }

  Future<String> _getExternalDatabaseBackupPath() async {
    // for android only
    if (Platform.isAndroid) {
      Directory? externalStoragePath = await getExternalStorageDirectory();
      await externalStoragePath!.create();
      String externalDatabasePath = join(externalStoragePath.path, _databaseBackupName);
      return externalDatabasePath;
    } else if (Platform.isIOS) {
      Directory? downloadsStoragePath = await getDownloadsDirectory();
      await downloadsStoragePath!.create();
      String externalDatabasePath = join(downloadsStoragePath.path, _databaseBackupName);
      return externalDatabasePath;
    } else {
      throw Exception("not implemented");
    }
  }

  Future<void> createLocalDatabaseBackup() async {
    try {
      await PermissionsService.instance.checkStoragePermission();
      String databasePath = await _getInternalDatabasePath();
      File databaseFile = File(databasePath);
      String externalDatabasePath = await _getExternalDatabaseBackupPath();

      // remove user info from backup
      User savedUser = await UsersRepository.instance.getUser();
      await UsersRepository.instance.updateUser(
          User(email: "", firstName: "", lastName: "", verified: false, loginCanCheck2FA: false, token: ""));

      await databaseFile.copy(externalDatabasePath);

      // restore user info after backup creation
      await UsersRepository.instance.updateUser(savedUser);
    } catch (err) {
      kLogger.e(err);
    }
  }

  Future<bool> restoreDatabaseFromLocalBackup() async {
    try {
      await PermissionsService.instance.checkStoragePermission();
      String externalDatabasePath = await _getExternalDatabaseBackupPath();
      File backupDatabaseFile = File(externalDatabasePath);
      if (backupDatabaseFile.existsSync() == false) {
        return false;
      }
      String databasePath = await _getInternalDatabasePath();

      await backupDatabaseFile.copy(databasePath);
      await _initDatabase(); // reinitialize the database

      return true;
    } catch (err) {
      kLogger.e(err);
      return false;
    }
  }

  Future<void> deleteDatabase() async {
    String databasePath = await _getInternalDatabasePath();
    await databaseFactory.deleteDatabase(databasePath);
  }

  Future<bool> createCloudDatabaseBackup(String cloudUploadURI, String method, String backupFileName) async {
    try {
      await PermissionsService.instance.checkStoragePermission();
      String databasePath = await _getInternalDatabasePath();
      File databaseFile = File(databasePath);

      // remove user info from backup
      User savedUser = await UsersRepository.instance.getUser();
      await UsersRepository.instance.updateUser(
          User(email: "", firstName: "", lastName: "", verified: false, loginCanCheck2FA: false, token: ""));

      final request = http.Request(method, Uri.parse(cloudUploadURI));
      request.bodyBytes = databaseFile.readAsBytesSync();
      final response = await request.send();

      // restore user info after backup creation
      await UsersRepository.instance.updateUser(savedUser);

      return true;
    } catch (err) {
      kLogger.e(err);
      return false;
    }
  }

  Future<bool> restoreDatabaseFromCloudBackup(String cloudDownloadURI) async {
    try {
      await PermissionsService.instance.checkStoragePermission();

      final response = await http.get(Uri.parse(cloudDownloadURI));
      if (response.statusCode != 200) {
        throw Exception("failed to download database backup");
      }

      String databasePath = await _getInternalDatabasePath();
      File(databasePath).writeAsBytesSync(response.bodyBytes);
      await _initDatabase();

      return true;
    } catch (err) {
      kLogger.e(err);
      return false;
    }
  }

  Future<Database> _initDatabase() async {
    String databasePath = await _getInternalDatabasePath();
    int numberOfMigrations = migrationsScripts.length;
    return await openDatabase(
      databasePath,
      version: numberOfMigrations,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
    );
  }

  Future _onCreate(Database db, int version) async {
    // if the database doesn't exists, create it with all the migrations
    for (int i = 1; i <= version; i++) {
      await db.execute(migrationsScripts[i] as String);
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // if the database exists, upgrade it with all the migrations from the old
    // version to the new version
    for (int i = oldVersion + 1; i <= newVersion; i++) {
      await db.execute(migrationsScripts[i] as String);
    }
  }

  Future _onConfigure(Database db) async {
    // enable foreign keys for the database
    await db.execute("PRAGMA foreign_keys = ON");
  }
}
