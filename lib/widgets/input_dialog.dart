// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_local_storage/models/todo.dart';
import 'package:todo_hive_local_storage/repositories/todo_database.dart';

class InputDialog extends StatefulWidget {
  Todo todo;
  InputDialog({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: widget.todo.taskName,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black45)),
                    onPressed: () {
                      context.read<TodoDatabase>().updateTodo(widget.todo,
                          _controller.text, widget.todo.taskCompleted);
                      Navigator.pop(context);
                    },
                    label: const Text(
                      'Save',
                      style: TextStyle(color: Colors.blue),
                    ),
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.blue,
                    )),
                const SizedBox(
                  width: 16,
                ),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black45)),
                    onPressed: () {
                      context.read<TodoDatabase>().deleteTodo(widget.todo);
                      Navigator.pop(context);
                    },
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
