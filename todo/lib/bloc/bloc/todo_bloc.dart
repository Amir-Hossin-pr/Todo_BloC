import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) {
    emit(TodoLoaded(todos: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      emit(
        TodoLoaded(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {}

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    final state = this.state;
    if (state is TodoLoaded) {
      emit(
        TodoLoaded(
          todos: List.from(state.todos)
            ..removeWhere((todo) => todo.id == event.todo.id),
        ),
      );
    }
  }
}
