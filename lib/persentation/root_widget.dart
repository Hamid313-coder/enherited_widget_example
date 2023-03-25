import 'package:flutter/material.dart';
import 'package:todos/data/todos_state.dart';
import 'package:todos/models/todo.dart';
import 'package:todos/persentation/todos_screen.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  final List<Todo> todos = [
    Todo(id: "lsdjf", name: "come", isDone: false),
    Todo(id: "lsd", name: "go right", isDone: true),
  ];

  void addTodo(Todo todo) {
    setState(() => todos.add(todo));
  }

  void removeTodo(String id) {
    setState(() => todos.removeWhere((todo) => todo.id == id));
  }

  void markDone(String id) {
    setState(() {
      todos[todos.indexWhere((todo) => todo.id == id)].isDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TodoState(
      widget.key,
      todos: todos,
      addTodo: addTodo,
      removeTodo: removeTodo,
      markDone: markDone,
      child: const TodosScreen(),
    );
  }
}
