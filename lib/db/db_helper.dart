import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('db null');
      return;
    }
    try {
      String path = await getDatabasesPath() + 'task.db';
      _db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE $_tableName ('
          'id INTEGER PRIMARY KEY autoincrement, '
          'title STRING, note TEXT, date STRING, '
          'startTime STRING, endTime STRING,'
          'remind INTEGER, repeat STRING, '
          'color INTEGER, '
          'isCompleted INTEGER)',
        );
      });
      debugPrint('db Create');
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert');
    try {
      return await _db!.insert(_tableName, task!.toJson());
    } catch (e) {
      print(e);
      return 1;
    }
  }

  static Future<int> delete(Task? task) async {
    print('delete');
    return await _db!
        .delete(_tableName, where: 'id = ?', whereArgs: [task!.id]);
  }

  static Future<int> deleteAll() async {
    print('deleteAll called');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('query');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    print('update');
    return await _db!.rawUpdate(
        'UPDATE $_tableName SET isCompleted = ? WHERE id = ?', [1, id]);
  }
}
