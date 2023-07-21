import 'package:bloc_demo/data/models/task.dart';
import 'package:bloc_demo/logic/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

class AddTaskContainer extends StatelessWidget {
  const AddTaskContainer({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    var task = Task(title: titleController.text);
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}