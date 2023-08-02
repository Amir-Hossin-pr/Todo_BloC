import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc/todo_bloc.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      if (state is TodoLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is TodoLoaded) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return ListTile(
                leading: (todo.isCompelete ?? false)
                    ? const Icon(Icons.check_circle_outline)
                    : const Icon(Icons.circle_outlined),
                title: Text(todo.title),
                subtitle: Text(todo.description),
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
}
