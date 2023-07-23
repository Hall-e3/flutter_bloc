import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppBlocEvent, AppState> {
  AppBloc() : super(AppState(currentItem: 0)) {
    on<SetCurrentItem>(_onSetCurrentItem);
  }
  void _onSetCurrentItem(SetCurrentItem event, Emitter<AppState> emit) {
    emit(AppState(currentItem: event.currentItem));
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState(currentItem: json['currentItem']);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}
