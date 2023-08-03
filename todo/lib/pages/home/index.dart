import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/bloc/todo_filter/todo_filter_bloc.dart';
import 'package:todo/models/todo_filter.dart';
import 'package:todo/pages/list/todos_list.dart';
import 'package:todo/router/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          elevation: 4,
          backgroundColor: Colors.lightBlue,
          bottom: TabBar(
            onTap: (index) => _changeTab(context, index),
            tabs: const [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.more_horiz),
                    Text('All'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.pending_actions),
                    Text('Pending'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.check),
                    Text('Completed'),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTodo(context),
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: [
            TodosListView(),
            TodosListView(),
            TodosListView(),
          ],
        ),
      ),
    );
  }

  void _addTodo(BuildContext context) {
    GoRouter.of(context).push(upsert);
  }

  void _changeTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        BlocProvider.of<TodoFilterBloc>(context).add(UpdateTodos(
          todoFilter: TodoFilter.all,
        ));
        break;
      case 1:
        BlocProvider.of<TodoFilterBloc>(context).add(UpdateTodos(
          todoFilter: TodoFilter.pending,
        ));
        break;
      case 2:
        BlocProvider.of<TodoFilterBloc>(context).add(UpdateTodos(
          todoFilter: TodoFilter.completed,
        ));
        break;
      default:
    }
  }
}
