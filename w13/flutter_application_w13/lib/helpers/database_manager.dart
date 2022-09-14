import 'dart:io';
import 'package:path/path.dart' as mypath;
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DatabaseManager {
  static const String kDatabaseName = 'todo.db';

  // Use this class as a singleton
  static final DatabaseManager instance = DatabaseManager._internal();
  DatabaseManager._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Instantiate the database only when it's not been initialized yet.

    _database = await _initDatabase();
    return _database!;
  }

  // Creates and opens the database.
  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = mypath.join(databasesPath, kDatabaseName);
    await Directory(databasesPath).create(recursive: true);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Creates the database structure
  Future _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
      create table ${Task.kTableName} (
      ${Task.kColumnID} integer primary key autoincrement,
      ${Task.kColumnTitle} text not null,
      ${Task.kColumnIsDone} integer not null)
      ''');
  }
}
