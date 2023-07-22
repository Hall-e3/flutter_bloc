// ignore_for_file: must_be_immutable

part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool toggleOnAndOff;
  SwitchState({required this.toggleOnAndOff});

  @override
  List<Object> get props => [toggleOnAndOff];

  Map<String, dynamic> toJson() {
    return {
      "toggleOnAndOff": toggleOnAndOff,
    };
  }

  factory SwitchState.fromJson(Map<String, dynamic> json) {
    return SwitchState(toggleOnAndOff: json['toggleOnAndOff'] ?? false);
  }
}
