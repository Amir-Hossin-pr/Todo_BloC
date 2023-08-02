part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {}

class UpdateFilter extends TodoFilterEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateTodos extends TodoFilterEvent {
  final TodoFilter todoFilter;

  UpdateTodos({this.todoFilter = TodoFilter.all});

  @override
  List<Object?> get props => [todoFilter];
}
