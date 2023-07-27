import 'package:flutter/material.dart';
import '../../data/models/task.dart';
import '../../logic/blocs/bloc_exports.dart';
import '../../logic/blocs/task_bloc/tasks_state.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
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
                label: Text(" ${state.allTasks.length} Tasks"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    var task = tasksList[index];
                    return Row(
                      children: [Text(task.id), Text(task.title)],
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
