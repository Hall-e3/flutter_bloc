import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import 'task_list.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;
  const TasksList({
    super.key,
    required this.tasksList,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: tasksList
          .map((task) => ExpansionPanelRadio(
              value: task.id,
              headerBuilder: (context, isOpen) => TaskTile(task: task),
              body: const Text("Description")))
          .toList(),
    );
  }
}
