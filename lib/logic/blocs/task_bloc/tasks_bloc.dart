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
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> allTasks = (state.allTasks
        .map((task) => task.id == event.task.id ? event.task : task)).toList();

    emit(TasksState(
      allTasks: allTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: (state.allTasks.where((task) => task.id != event.task.id))
            .toList()));
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
