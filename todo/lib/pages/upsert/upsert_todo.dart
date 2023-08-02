import 'package:flutter/material.dart';
import 'package:todo/pages/widget/button.dart';
import 'package:todo/pages/widget/input.dart';

class UpsertTodoScreen extends StatelessWidget {
  UpsertTodoScreen({super.key});

  //? Controllers
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add or Update Todo'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            InputOutline(
                clearable: true,
                controller: title,
                hint: 'Title',
                lable: 'Title',
                maxLines: 1,
                isRequired: true),
            const SizedBox(height: 15),
            InputOutline(
                clearable: true,
                controller: description,
                hint: 'Description',
                lable: 'Description',
                maxLines: 4,
                isRequired: true),
            const SizedBox(height: 15),
            Button(
              onPressed: () {},
              color: Colors.lightBlue,
              lable: 'Submit',
              icon: const Icon(Icons.check),
              borderRadius: 15,
            )
          ],
        ),
      ),
    );
  }
}
