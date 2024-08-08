import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/data/datasource/task_datasource.dart';

final taskDataSourceProvider = Provider<TaskDataSource>(
  (ref) {
    return TaskDataSource();
  },
);
