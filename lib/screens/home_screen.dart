import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_local_storage/models/todo.dart';
import 'package:todo_hive_local_storage/repositories/todo_database.dart';
import 'package:todo_hive_local_storage/widgets/add_dialog.dart';
import 'package:todo_hive_local_storage/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<TodoDatabase>().fetchTodos();
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: todos.length == 0
          ? const Center(child: Text('Nothing To Do Right Now!'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  todo: todos[index],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            context: context,
            backgroundColor: Colors.yellow[200],
            builder: (context) {
              return const AddDialog();
            }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
