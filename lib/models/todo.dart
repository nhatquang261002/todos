// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  int? id;
  String taskName;

  bool taskCompleted;

  Todo({
    this.id,
    required this.taskName,
    required this.taskCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taskName': taskName,
      'taskCompleted': taskCompleted == true ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] != null ? map['id'] as int : null,
      taskName: map['taskName'] as String,
      taskCompleted: map['taskCompleted'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  Todo copyWith({
    int? id,
    String? taskName,
    bool? taskCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      taskCompleted: taskCompleted ?? this.taskCompleted,
    );
  }

  @override
  String toString() =>
      'Todo(id: $id, taskName: $taskName, taskCompleted: $taskCompleted)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.taskName == taskName &&
        other.taskCompleted == taskCompleted;
  }

  @override
  int get hashCode => id.hashCode ^ taskName.hashCode ^ taskCompleted.hashCode;
}
