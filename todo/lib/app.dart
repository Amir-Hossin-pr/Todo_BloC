import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo/todo_bloc.dart';
import 'package:todo/bloc/todo_filter/todo_filter_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/home/index.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc()
            ..add(
              LoadTodos(
                todos: TodoModel.todos,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => TodoFilterBloc(
            todoBloc: BlocProvider.of<TodoBloc>(context),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
