part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;
  const TasksState(
      {this.allTasks = const <Task>[], this.removedTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks, removedTasks];

  Map<String, dynamic> toJson() {
    return {
      "allTasks": allTasks.map((e) => e.toJson()).toList(),
      "removedTasks": allTasks.map((e) => e.toJson()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> json) {
    return TasksState(
        allTasks:
            List<Task>.from(json["allTasks"]?.map((x) => Task.fromJson(x))),
        removedTasks: List<Task>.from(
            json["removedTasks"]?.map((x) => Task.fromJson(x))));
  }
}
