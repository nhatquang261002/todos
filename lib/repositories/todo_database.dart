import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo.dart';

class TodoDatabase extends ChangeNotifier {
  static Database? _database;

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT NOT NULL,
        taskCompleted INTEGER NOT NULL
      )
  ''');
  }

  Future<List<Todo>> fetchTodos() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('todo', orderBy: 'id DESC');

    return List.generate(
      items.length,
      (index) => Todo.fromMap(items[index]),
    );
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;

    await db.insert('todo', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    final db = await database;

    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
    notifyListeners();
  }

  Future<void> updateTodo(Todo todo) async {
    final db = await database;

    await db
        .update('todo', todo.toMap(), where: 'id == ?', whereArgs: [todo.id]);
    notifyListeners();
  }
}
