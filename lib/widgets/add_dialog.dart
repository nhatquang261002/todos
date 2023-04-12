import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_local_storage/models/todo.dart';
import 'package:todo_hive_local_storage/repositories/todo_database.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({Key? key}) : super(key: key);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: 'What\'s your plan?',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () {
              context.read<TodoDatabase>().addTodo(
                  Todo(taskName: _controller.text, taskCompleted: false));
              Navigator.pop(context);
            },
            label: const Text(
              'ADD',
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
