import '../../../data/models/task.dart';
import '../bloc_exports.dart';
import 'package:equatable/equatable.dart';

import 'tasks_state.dart';

part 'tasks_event.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksLoading()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksLoaded(allTasks: state.allTasks));
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksLoaded(allTasks: List.from(state.allTasks)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> allTasks = (state.allTasks
        .map((task) => task.id == event.task.id ? event.task : task)).toList();

    emit(TasksLoaded(
      allTasks: allTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksLoaded(
        allTasks: (state.allTasks.where((task) => task.id != event.task.id))
            .toList()));
  }

  @override
  TasksState fromJson(Map<String, dynamic> json) {
    return TasksState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toJson();
  }
}
