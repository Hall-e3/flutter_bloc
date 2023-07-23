import 'package:bloc_demo/presentation/screens/completed_tasks_screen.dart';
import 'package:bloc_demo/presentation/screens/favorite_tasks_screen.dart';
import 'package:bloc_demo/presentation/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/presentation/screens/drawer.dart';

import '../../logic/blocs/bloc_exports.dart';
import '../widgets/add_tasks_container.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {"pageName": const PendingTasksScreen(), "title": "Pending Tasks"},
    {"pageName": const CompletedTasksScreen(), "title": "Completed Tasks"},
    {"pageName": const FavoriteTasksScreen(), "title": "Favorite Tasks"}
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const SingleChildScrollView(
              child: AddTaskContainer(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        print(state.currentItem);
        return Scaffold(
          appBar: AppBar(
            title: Text(_pageDetails[_selectedPageIndex]['title']),
            actions: [
              IconButton(
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add))
            ],
          ),
          drawer: const CustomDrawer(),
          body: _pageDetails[_selectedPageIndex]['pageName'],
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
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
