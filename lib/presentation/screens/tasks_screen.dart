import 'package:bloc_demo/data/models/task.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  List<Task> tasksList = [
    Task(title: "title1"),
    Task(title: "title2"),
    Task(title: "title3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks App"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text("Tasks:"),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (contex, index) {
                  var task = tasksList[index];
                  return ListTile(
                    title: Text(task.title),
                    trailing:
                        Checkbox(value: task.isDone, onChanged: (value) {}),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
