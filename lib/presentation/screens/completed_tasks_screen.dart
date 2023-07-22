import 'package:flutter/material.dart';
import '../../data/models/task.dart';
import '../../logic/blocs/bloc_exports.dart';
import "../widgets/tasks_list.dart";

// ignore: must_be_immutable
class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});
  static const id = "tasks_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text("Tasks: ${tasksList.length}"),
              ),
            ),
            TasksList(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
