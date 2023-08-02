import 'package:flutter/material.dart';
import 'package:todo/pages/list/todos_list.dart';
import 'package:todo/pages/upsert/upsert_todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        elevation: 4,
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodo(context),
        child: const Icon(Icons.add),
      ),
      body: TodosListView(),
    );
  }

  void _addTodo(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UpsertTodoScreen(),
        ));
  }
}
