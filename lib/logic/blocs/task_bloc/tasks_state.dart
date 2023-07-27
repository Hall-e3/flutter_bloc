import 'package:equatable/equatable.dart';
import '../../../data/models/task.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toJson() {
    return {
      "allTasks": allTasks.map((x) => x.toJson()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> json) {
    return TasksState(
      allTasks: List<Task>.from(json["allTasks"]?.map((x) => Task.fromJson(x))),
    );
  }
}

class TasksLoading extends TasksState {
  const TasksLoading() : super();

  @override
  List<Object> get props => [];
}

class TasksLoaded extends TasksState {
  final List<Task> allTasks;

  const TasksLoaded({required this.allTasks}) : super(allTasks: allTasks);

  @override
  List<Object> get props => [allTasks];
}

class ErrorState extends TasksState {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
