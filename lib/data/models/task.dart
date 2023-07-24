import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  bool? isDone;
  bool? isDeleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.isDeleted,
      this.isDone}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith(
      {String? id,
      String? title,
      String? description,
      bool? isDone,
      bool? isDeleted}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        isDone: json['isDone'],
        isDeleted: json['isDeleted']);
  }

  @override
  List<Object?> get props => [id, title, description, isDone, isDeleted];
}
