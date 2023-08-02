part of 'todo_filter_bloc.dart';

abstract class TodoFilterState extends Equatable {}

class TodoFilterLoading extends TodoFilterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TodoFilterLoaded extends TodoFilterState {
  final List<TodoModel> filtredTodos;
  final TodoFilter todoFilter;

  TodoFilterLoaded({
    required this.filtredTodos,
    this.todoFilter = TodoFilter.all,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        filtredTodos,
        todoFilter,
      ];
}
