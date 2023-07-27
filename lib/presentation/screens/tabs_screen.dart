import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/task.dart';
import '../../logic/blocs/bloc_exports.dart';
import '../services/uuid_generator.dart';
import 'all_tasks.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {"pageName": const TasksScreen(), "title": " Tasks"},
    // {"pageName": const CompletedTasksScreen(), "title": "Completed Tasks"},
    // {"pageName": const FavoriteTasksScreen(), "title": "Favorite Tasks"}
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autofocus: true,
                      controller: descriptionController,
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          label: Text('Description'),
                          border: OutlineInputBorder()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cancel")),
                        ElevatedButton(
                          onPressed: () {
                            var task = Task(
                                id: GUIDGen.generate(),
                                title: titleController.text,
                                description: descriptionController.text,
                                date: DateFormat()
                                    .add_yMMMd()
                                    .add_Hms()
                                    .format(DateTime.now()));
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
            )));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_pageDetails[state.currentItem]['title']),
            actions: [
              IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add))
            ],
          ),
          // drawer: const CustomDrawer(),
          body: _pageDetails[state.currentItem]['pageName'],
          floatingActionButton: state.currentItem == 0
              ? FloatingActionButton(
                  onPressed: () => _addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentItem,
            onTap: (index) => context.read<AppBloc>()
              ..add(SetCurrentItem(currentItem: index)),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.incomplete_circle_sharp),
                  label: "Pending Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done), label: "Completed Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite Tasks")
            ],
          ),
        );
      },
    );
  }
}
