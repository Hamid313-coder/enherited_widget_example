import 'package:flutter/material.dart';
import 'package:todos/data/todos_state.dart';
import 'package:todos/persentation/widgets/heading.dart';
import 'package:todos/persentation/widgets/todo_item.dart';
import 'package:todos/persentation/widgets/todo_text_field.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoState = TodoState.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff48c6ef), Color(0xff6f86d6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Column(
              children: [
                TodoTextField(),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      const Heading(
                        text: "To do",
                      ),
                      ...todoState.todos
                          .where((element) => !element.isDone)
                          .map((todo) => TodoItem(
                                todo: todo,
                              ))
                          .toList()
                          .reversed,
                      const SizedBox(
                        height: 16,
                      ),
                      const Heading(text: "Done"),
                      ...todoState.todos
                          .where((element) => element.isDone)
                          .map((todo) => TodoItem(
                                todo: todo,
                              ))
                          .toList()
                          .reversed,
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
