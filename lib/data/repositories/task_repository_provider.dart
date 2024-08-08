import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/data/data.dart';

final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) {
    final dataSource = ref.watch(taskDataSourceProvider);
    return TaskRepositoryImpl(dataSource);
  },
);
