import 'package:bloc_demo/presentation/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/recycle_bin.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
    }
    return null;
  }
}
