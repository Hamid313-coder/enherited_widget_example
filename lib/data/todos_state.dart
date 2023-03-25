import 'package:flutter/material.dart';
import 'package:todos/models/todo.dart';

class TodoState extends InheritedWidget {
  final Widget child;
  final List<Todo> todos;
  final Function(Todo todo) addTodo;
  final Function(String id) removeTodo;
  final Function(String id) markDone;

  const TodoState(Key? key,
      {required this.child,
      required this.todos,
      required this.addTodo,
      required this.removeTodo,
      required this.markDone})
      : super(key: key, child: child);

  static TodoState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TodoState>()!;

  @override
  bool updateShouldNotify(TodoState oldWidget) {
    return true;
  }
}
