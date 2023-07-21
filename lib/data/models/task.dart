import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, this.isDeleted, this.isDone}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({String? title, bool? isDone, bool? isDeleted}) {
    return Task(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        title: json['title'] ?? '',
        isDone: json['isDone'],
        isDeleted: json['isDeleted']);
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted];
}
