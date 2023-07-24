part of 'tasks_bloc.dart';

class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Task task;
  const RemoveTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

class BookMarkTask extends TasksEvent {
  final Task task;

  const BookMarkTask({required this.task});

  @override
  List<Object> get props => [task];
}

class EditTask extends TasksEvent {
  final Task task;

  const EditTask({required this.task});

  @override
  List<Object> get props => [task];
}

class RestoreTask extends TasksEvent {
  final Task task;

  const RestoreTask({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TasksEvent {
  final List<Task> allTasks;

  const DeleteAllTasks({required this.allTasks});

  @override
  List<Object> get props => [allTasks];
}
