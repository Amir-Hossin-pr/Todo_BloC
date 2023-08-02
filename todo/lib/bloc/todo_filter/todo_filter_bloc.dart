import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/bloc/todo/todo_bloc.dart';
import 'package:todo/models/todo.dart';

import '../../models/todo_filter.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  final TodoBloc _todoBloc;
  late StreamSubscription _todoSubscription;

  TodoFilterBloc({required TodoBloc todoBloc})
      : _todoBloc = todoBloc,
        super(TodoFilterLoading()) {
    on<UpdateFilter>(_onUpdateFilter);
    on<UpdateTodos>(_onUpdateTodos);

    _todoSubscription = _todoBloc.stream.listen((state) {
      add(
        UpdateTodos(),
      );
    });
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<TodoFilterState> emit) {
    if (state is TodoFilterLoading) {
      add(
        UpdateTodos(todoFilter: TodoFilter.pending),
      );
    }

    if (state is TodoFilterLoaded) {
      final state = this.state as TodoFilterLoaded;

      add(
        UpdateTodos(todoFilter: state.todoFilter),
      );
    }
  }

  void _onUpdateTodos(UpdateTodos event, Emitter<TodoFilterState> emit) {
    final state = _todoBloc.state;
    if (state is TodoLoaded) {
      List<TodoModel> todos = state.todos.where((todo) {
        switch (event.todoFilter) {
          case TodoFilter.all:
            return true;
          case TodoFilter.cancled:
            return todo.isCancled;
          case TodoFilter.completed:
            return todo.isCompelete;
          case TodoFilter.pending:
            return !(todo.isCompelete && todo.isCancled);
          default:
            return true;
        }
      }).toList();

      emit(
        TodoFilterLoaded(filtredTodos: todos),
      );
    }
  }
}
