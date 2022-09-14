import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_application_w13/models/task.dart';
import 'package:sqflite/sqflite.dart';

import '../helpers/database_manager.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];
  late Database _database;

  TaskData() {
    loadDatabase();
  }

  Future<void> loadDatabase() async {
    _database = await DatabaseManager.instance.database;
    List<Map> rs = await _database.query(Task.kTableName);
    for (var item in rs) {
      Task task = Task.fromMap(item);
      _tasks.add(task);
    }
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get count {
    return _tasks.length;
  }

  void addTask(String taskTitle) async {
    final task = Task(title: taskTitle);
    await _database.insert(Task.kTableName, task.toMap());
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggle();
    await _database.update(Task.kTableName, task.toMap(),
        where: '${Task.kColumnID} = ?', whereArgs: [task.id]);
    notifyListeners();
  }

  void deleteTask(Task task) async {
    _tasks.remove(task);
    await _database.delete(Task.kTableName,
        where: '${Task.kColumnID} = ?', whereArgs: [task.id]);
    notifyListeners();
  }

  Future closeDatabase() async {
    await _database.close();
  }

  @override
  void dispose() {
    closeDatabase();
    super.dispose();
  }
}
