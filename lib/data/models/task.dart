import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String date;
  final String description;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      this.isFavorite,
      this.isDeleted,
      this.isDone}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith(
      {String? id,
      String? title,
      String? description,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isDone: isDone ?? this.isDone,
        isFavorite: isFavorite ?? this.isFavorite,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        date: json['date'] ?? '',
        isDone: json['isDone'],
        isFavorite: json['isFavorite'],
        isDeleted: json['isDeleted']);
  }

  @override
  List<Object?> get props =>
      [id, title, description, date, isFavorite, isDone, isDeleted];
}
