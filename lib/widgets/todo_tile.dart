// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sqflite/repositories/todo_database.dart';
import '../models/todo.dart';
import '../widgets/input_dialog.dart';

import '../models/todo.dart';

class TodoTile extends StatefulWidget {
  Todo todo;

  TodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onLongPress: () => showDialog(
            context: context,
            builder: (context) => InputDialog(todo: widget.todo)),
        child: CheckboxListTile(
            tileColor: Colors.yellow,
            contentPadding: const EdgeInsets.all(12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            value: widget.todo.taskCompleted,
            onChanged: (bool? value) {
              setState(() {
                widget.todo.taskCompleted = value!;
              });
              context
                  .read<TodoDatabase>()
                  .updateTodo(widget.todo.copyWith(taskCompleted: value));
            },
            checkColor: const Color.fromARGB(164, 0, 0, 0),
            title: Text(widget.todo.taskName),
            controlAffinity: ListTileControlAffinity.leading),
      ),
    );
  }
}
