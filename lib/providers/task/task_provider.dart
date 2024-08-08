import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/data/repositories/repositories.dart';
import 'package:notbook_todo/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>(
  (ref) {
    final repository = ref.watch(taskRepositoryProvider);
    return TaskNotifier(repository);
  },
);
