import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/utils/utils.dart';

final categoryProvider = StateProvider<TaskCategories>(
  (ref) {
    return TaskCategories.others;
  },
);
