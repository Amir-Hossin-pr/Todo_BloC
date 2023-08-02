import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo/todo_bloc.dart';
import 'package:todo/bloc/todo_filter/todo_filter_bloc.dart';
import 'package:todo/models/todo.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoFilterBloc, TodoFilterState>(
        listener: (context, state) {
      if (state is TodoFilterLoaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.filtredTodos.length} Todos Load'),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is TodoFilterLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is TodoFilterLoaded) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: state.filtredTodos.length,
            itemBuilder: (context, index) {
              final todo = state.filtredTodos[index];
              return ListTile(
                leading: IconButton(
                  onPressed: () => _changeTodo(context, todo),
                  icon: todo.isCompelete
                      ? const Icon(Icons.check_circle_outline)
                      : const Icon(Icons.circle_outlined),
                ),
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: IconButton(
                  onPressed: () => _removeTodo(context, todo),
                  icon: const Icon(Icons.remove_circle_outline,
                      color: Colors.red),
                ),
              );
            },
          ),
        );
      } else {
        return const Center(
          child: Text('Somthing went wrong!'),
        );
      }
    });
  }

  void _changeTodo(BuildContext context, TodoModel todo) {
    context.read<TodoBloc>().add(
          UpdateTodo(
              todo: todo.copyWith(
            isCompelete: !todo.isCompelete,
          )),
        );
  }

  void _removeTodo(BuildContext context, TodoModel todo) {
    context.read<TodoBloc>().add(
          DeleteTodo(todo: todo),
        );
  }
}
