import 'package:flutter/material.dart';
import 'package:todos/data/todos_state.dart';
import 'package:todos/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    final todoState = TodoState.of(context);
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) => todoState.markDone(todo.id),
        activeColor: Colors.white,
        checkColor: const Color(0xff48c6ef),
        side: const BorderSide(
            color: Colors.white, width: 2, style: BorderStyle.solid),
      ),
      title: Text(
        todo.name,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
        ),
        onPressed: () => todoState.removeTodo(todo.id),
      ),
    );
  }
}
