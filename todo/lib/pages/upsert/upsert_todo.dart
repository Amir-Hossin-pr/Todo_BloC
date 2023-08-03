import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/bloc/todo/todo_bloc.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/pages/widget/button.dart';
import 'package:todo/pages/widget/input.dart';
import 'package:todo/router/router.dart';

class UpsertTodoScreen extends StatelessWidget {
  UpsertTodoScreen({super.key});

  //? Controllers
  final id = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();

  //? Key
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Update Todo'),
        backgroundColor: Colors.lightBlue,
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoLoaded) {
            id.text = '';
            title.text = '';
            description.text = '';
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success fully add todo'),
              ),
            );
            Navigator.pop(context);
          }
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Form(
              key: key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  InputOutline(
                      clearable: true,
                      controller: id,
                      hint: 'Id',
                      lable: 'Id',
                      maxLines: 1,
                      isRequired: true,
                      errorText: 'Please input some id'),
                  const SizedBox(height: 15),
                  InputOutline(
                      clearable: true,
                      controller: title,
                      hint: 'Title',
                      lable: 'Title',
                      maxLines: 1,
                      isRequired: true,
                      errorText: 'Please input some title'),
                  const SizedBox(height: 15),
                  InputOutline(
                      clearable: true,
                      controller: description,
                      hint: 'Description',
                      lable: 'Description',
                      maxLines: 4,
                      isRequired: true,
                      errorText: 'Please input some description'),
                  const SizedBox(height: 15),
                  Button(
                    onPressed: () => _submitTodo(context),
                    color: Colors.lightBlue,
                    lable: 'Submit',
                    icon: const Icon(Icons.check),
                    borderRadius: 15,
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _submitTodo(BuildContext contex) {
    if (key.currentState!.validate()) {
      contex.read<TodoBloc>().add(
            AddTodo(
              todo: TodoModel(
                title: title.text,
                description: description.text,
                id: id.text,
              ),
            ),
          );
    }
  }
}
