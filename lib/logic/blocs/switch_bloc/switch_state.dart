// ignore_for_file: must_be_immutable

part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool toggleOnAndOff;
  SwitchState({required this.toggleOnAndOff});

  @override
  List<Object> get props => [toggleOnAndOff];
}

// class SwitchInitial extends SwitchState {
//   SwitchInitial({required bool toggleOnAndOff})
//       : super(toggleOnAndOff: toggleOnAndOff);
// }
