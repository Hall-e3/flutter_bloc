part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toJson() {
    return {
      "allTasks": allTasks.map((e) => e.toJson()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> json) {
    return TasksState(
        allTasks:
            List<Task>.from(json["allTasks"]?.map((x) => Task.fromJson(x))));
  }
}
