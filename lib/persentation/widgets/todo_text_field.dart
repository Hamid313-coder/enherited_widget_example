import 'package:flutter/material.dart';
import 'package:todos/data/todos_state.dart';
import 'package:todos/models/todo.dart';

class TodoTextField extends StatelessWidget {
  TodoTextField({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoState = TodoState.of(context);
    var underlineInputBorder =
        const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter your todo...",
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: IconButton(
              onPressed: () => todoState.addTodo(Todo(
                  id: DateTime.now().toString(),
                  name: _controller.text,
                  isDone: false)),
              icon: const Icon(Icons.add, color: Colors.white, size: 24)),
          enabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
        ),
      ),
    );
  }
}
