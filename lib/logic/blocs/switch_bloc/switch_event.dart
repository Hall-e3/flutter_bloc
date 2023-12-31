part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class ToggleOn extends SwitchEvent {}
class ToggleOff extends SwitchEvent {}
