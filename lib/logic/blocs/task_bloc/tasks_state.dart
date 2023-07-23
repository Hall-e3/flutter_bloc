part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  
  const TasksState(
      {this.pendingTasks = const <Task>[],
      this.removedTasks = const <Task>[],
      this.completedTasks = const <Task>[],
      this.favoriteTasks = const <Task>[]});

  @override
  List<Object> get props =>
      [pendingTasks, removedTasks, completedTasks, favoriteTasks];

  Map<String, dynamic> toJson() {
    return {
      "pendingTasks": pendingTasks.map((x) => x.toJson()).toList(),
      "completedTasks": completedTasks.map((x) => x.toJson()).toList(),
      "favoriteTasks": favoriteTasks.map((x) => x.toJson()).toList(),
      "removedTasks": removedTasks.map((x) => x.toJson()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> json) {
    return TasksState(
        pendingTasks:
            List<Task>.from(json["pendingTasks"]?.map((x) => Task.fromJson(x))),
        completedTasks: List<Task>.from(
            json["completedTasks"]?.map((x) => Task.fromJson(x))),
        favoriteTasks: List<Task>.from(
            json["favoriteTasks"]?.map((x) => Task.fromJson(x))),
        removedTasks: List<Task>.from(
            json["removedTasks"]?.map((x) => Task.fromJson(x))));
  }
}
