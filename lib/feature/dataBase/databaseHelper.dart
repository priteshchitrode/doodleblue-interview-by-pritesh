import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  Future<int> insertTodo(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('todos', row);
  }

  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final db = await database;
    return await db.query('todos');
  }

  Future<int> updateTodo(Map<String, dynamic> row) async {
    final db = await database;
    final id = row['id'];
    return await db.update('todos', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
