import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/data/task.dart';
import 'package:to_do_list/data/user_state.dart';
import 'package:to_do_list/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserStateAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<UserState>(TasksDatabase.boxName);

  // change the color of the system (gesture) navigation bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.yellow[300],
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To do list',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
