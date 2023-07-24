import 'package:flutter/material.dart';

import '../../data/models/task.dart';
import '../../logic/blocs/bloc_exports.dart';
import 'popup_menu.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Text(task.date),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    context.read<TasksBloc>().add(UpdateTask(
                        task: task.copyWith(
                            isDone: task.isDone == false ? true : false)));
                  }),
              PopUpMenu(
                restore: () => context.read<TasksBloc>().add(RestoreTask(
                    task: task.copyWith(
                        isDeleted: task.isDeleted == true ? false : true))),
                task: task,
                cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
              )
            ],
          )
        ],
      ),
    );
  }

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }
}
