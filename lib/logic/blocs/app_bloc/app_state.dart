// ignore_for_file: must_be_immutable

part of 'app_bloc.dart';

class AppState extends Equatable {
  int currentItem;
  AppState({required this.currentItem});

  @override
  List<Object> get props => [currentItem];

  Map<String, dynamic> toJson() {
    return {
      "currentItem": currentItem,
    };
  }

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(currentItem: json['currentItem'] ?? 0);
  }
}
