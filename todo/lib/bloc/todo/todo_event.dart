part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class LoadTodos extends TodoEvent {
  final List<TodoModel> todos;

  LoadTodos({this.todos = const <TodoModel>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [todos];
}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  AddTodo({
    required this.todo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  final TodoModel todo;

  UpdateTodo({
    required this.todo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final TodoModel todo;

  DeleteTodo({
    required this.todo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}
