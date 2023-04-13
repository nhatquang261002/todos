import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

// https://www.youtube.com/watch?v=w8cZKm9s228
// https://www.youtube.com/watch?v=mMgr47QBZWA

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
