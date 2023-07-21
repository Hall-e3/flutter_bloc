import 'package:bloc_demo/data/models/task.dart';
import 'package:bloc_demo/presentation/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import 'logic/blocs/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(AddTask(task: Task(title: "Task1"))),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
