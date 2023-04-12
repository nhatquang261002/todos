import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_local_storage/models/todo.dart';
import 'package:todo_hive_local_storage/repositories/todo_database.dart';
import 'package:todo_hive_local_storage/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

// https://www.youtube.com/watch?v=w8cZKm9s228
// https://www.youtube.com/watch?v=mMgr47QBZWA

void main() async {
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoDatabase(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.yellow,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
