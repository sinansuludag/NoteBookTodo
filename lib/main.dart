import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/app/todo_app.dart';

void main() async {
  runApp(const ProviderScope(child: TodoApp()));
}
