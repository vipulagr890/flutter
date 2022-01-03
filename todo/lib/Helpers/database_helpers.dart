import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static late Database _db;

  DatabaseHelper._instance();

  String taskTables = "task_table";
  String colID = "Id";
  String coltask = "task";
  String coldate = "date";
  String colpriority = "Priority";
  String status = "Status";

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'todo_list.db';
    final todolistdb =
        await openDatabase(path, version: 1, onCreate: _createdb);
    return todolistdb;
  }

  void _createdb(Database db, int version) async {
    await db.execute('Create Table $taskTables($colID INTEGER PRIMARY KEY AUTOINCREAMENT, $coltask TEXT, $coldate TEXT, $colpriority TEXT, $status INTEGER ) ');
  }
}
