import 'package:flutter/material.dart';
import '../../logic/blocs/bloc_exports.dart';
import 'recycle_bin.dart';
import 'tasks_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text("Task Drawer",
                  style: TextStyle(color: Colors.grey.shade400)),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Tasks"),
                    trailing: Text("${state.allTasks.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text("Bin"),
                trailing: Text("0"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
