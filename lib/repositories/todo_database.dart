import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_local_storage/models/todo.dart';

class TodoDatabase extends ChangeNotifier {
  final _db = Hive.box<Todo>('todo');

  void addTodo(Todo todo) {
    _db.add(todo);
    notifyListeners();
  }

  List<Todo> fetchTodos() {
    var maps = _db.toMap();
    List<Todo> _todos = maps.values.toList();
    return _todos;
  }

  void updateTodo(Todo todo, String taskName, bool taskCompleted) {
    todo.taskName = taskName;
    todo.taskCompleted = taskCompleted;
    todo.save();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todo.delete();
    notifyListeners();
  }
}
