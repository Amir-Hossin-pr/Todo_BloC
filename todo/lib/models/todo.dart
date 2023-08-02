import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final String description;
  bool? isCompelete;
  bool? isCancled;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.isCancled,
    this.isCompelete,
  }) {
    isCancled = false;
    isCompelete = false;
  }

  TodoModel copyWith(
          {String? id,
          String? title,
          String? description,
          bool? isCompelete,
          bool? isCancled}) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isCancled: isCancled ?? this.isCancled,
        isCompelete: isCompelete ?? this.isCompelete,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        isCompelete,
        isCancled,
      ];

  static List<TodoModel> todos = [
    TodoModel(id: '1', title: 'Todo', description: 'Nothing'),
    TodoModel(id: '2', title: 'Todo 2', description: 'Nothing 2'),
  ];
}
