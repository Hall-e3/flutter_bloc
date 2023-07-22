import 'package:equatable/equatable.dart';
import '../bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState(toggleOnAndOff: false)) {
    on<ToggleOn>((event, emit) {
      emit(SwitchState(toggleOnAndOff: true));
    });

    on<ToggleOff>((event, emit) {
      emit(SwitchState(toggleOnAndOff: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toJson();
  }
}
