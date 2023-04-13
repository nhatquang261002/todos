import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sqflite/models/todo.dart';
import 'package:todo_sqflite/repositories/todo_database.dart';
import 'package:todo_sqflite/widgets/todo_tile.dart';

import '../repositories/todo_database.dart';
import '../widgets/add_dialog.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: context.watch<TodoDatabase>().fetchTodos(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          var dataLength = snapshot.data?.length ?? 0;
          return dataLength == 0
              ? const Center(
                  child: Text('No ToDo Right Now!'),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoTile(todo: data![index]);
                  },
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
