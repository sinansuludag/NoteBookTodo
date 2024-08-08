import 'package:flutter/material.dart';

enum TaskCategories {
  education,
  health,
  home,
  others,
  personal,
  shopping,
  social,
  travel,
  work,
}

extension TaskCategoryExtension on TaskCategories {
  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) {
          return category.name == name;
        },
      );
    } catch (e) {
      return TaskCategories.others;
    }
  }

  IconData get icon {
    switch (this) {
      case TaskCategories.education:
        return Icons.school;
      case TaskCategories.health:
        return Icons.favorite;
      case TaskCategories.home:
        return Icons.home;
      case TaskCategories.others:
        return Icons.calendar_month_rounded;
      case TaskCategories.personal:
        return Icons.person;
      case TaskCategories.shopping:
        return Icons.shopping_bag;
      case TaskCategories.social:
        return Icons.people;
      case TaskCategories.travel:
        return Icons.flight;
      case TaskCategories.work:
        return Icons.work;
    }
  }

  Color get color {
    switch (this) {
      case TaskCategories.education:
        return Colors.blueGrey;
      case TaskCategories.health:
        return Colors.orange;
      case TaskCategories.home:
        return Colors.green;
      case TaskCategories.others:
        return Colors.purple;
      case TaskCategories.personal:
        return Colors.lightBlue;
      case TaskCategories.shopping:
        return Colors.deepOrange;
      case TaskCategories.social:
        return Colors.brown;
      case TaskCategories.travel:
        return Colors.pink;
      case TaskCategories.work:
        return Colors.amber;
    }
  }
}
