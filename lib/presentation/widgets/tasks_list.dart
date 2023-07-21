import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import 'task_list.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (contex, index) {
            var task = tasksList[index];
            return TaskTile(task: task);
          }),
    );
  }
}
