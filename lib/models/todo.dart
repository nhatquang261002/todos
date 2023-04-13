import 'dart:convert';

class Todo {
  String taskName;

  bool taskCompleted;

  Todo({
    required this.taskName,
    required this.taskCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskName': taskName,
      'taskCompleted': taskCompleted,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      taskName: map['taskName'] as String,
      taskCompleted: map['taskCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
