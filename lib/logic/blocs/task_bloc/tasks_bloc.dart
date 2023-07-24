import '../../../data/models/task.dart';
import '../bloc_exports.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<BookMarkTask>(_onBookMarkTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTasks>(_onDeleteAllTasks);
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    if (event.task.isDone == false) {}
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTasks = (state.pendingTasks
        .map((task) => task.id == event.task.id ? event.task : task)).toList();
    List<Task> completedTasks = (state.completedTasks
        .map((task) => task.id == event.task.id ? event.task : task)).toList();
    if (event.task.isDone == true) {
      pendingTasks.remove(event.task);
      completedTasks.add(event.task);
    } else {
      pendingTasks.add(event.task);
      completedTasks.remove(event.task);
    }

    emit(TasksState(
        completedTasks: completedTasks,
        favoriteTasks: state.favoriteTasks,
        pendingTasks: pendingTasks,
        removedTasks: state.removedTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: (state.removedTasks
            .where((task) => task.id != event.task.id)).toList()));
  }

  void _onBookMarkTask(BookMarkTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: (state.removedTasks
            .where((task) => task.id != event.task.id)).toList()));
  }

  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: (state.removedTasks
            .where((task) => task.id != event.task.id)).toList()));
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> pendingTasks = (state.pendingTasks
        .map((task) => task.id == event.task.id ? event.task : task)).toList();

    print(event.task);

    // if (event.task.isDone == false) {
    //   pendingTasks.remove(event.task);
    // } else {
    //   pendingTasks.add(event.task);
    // }

    emit(TasksState(
        favoriteTasks: state.favoriteTasks,
        pendingTasks: pendingTasks,
        removedTasks: state.removedTasks));
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTasks: event.allTasks));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toJson();
  }
}
