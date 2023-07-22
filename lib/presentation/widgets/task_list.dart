import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import '../../logic/blocs/bloc_exports.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            context.read<TasksBloc>().add(UpdateTask(
                task: task.copyWith(
                    isDone: task.isDone == false ? true : false)));
          }),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
