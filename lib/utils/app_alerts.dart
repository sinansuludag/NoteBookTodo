import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notbook_todo/providers/providers.dart';
import 'package:notbook_todo/utils/utils.dart';

import '../data/models/models.dart';

class AppAlerts {
  AppAlerts._();
  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge
            ?.copyWith(color: context.colorSchema.surface),
      ),
      backgroundColor: context.colorSchema.primary,
    ));
  }

  static Future<void> showDeleteAlertdialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton =
        TextButton(onPressed: () => context.pop(), child: const Text("HAYIR"));
    Widget deleteButton = TextButton(
        onPressed: () async {
          await ref.read(taskProvider.notifier).deleteTask(task).then(
            (value) {
              AppAlerts.displaySnackBar(context, "Görev başarıyla silindi");
              context.pop();
            },
          );
        },
        child: const Text("EVET"));
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Bu görevi silmek istediğinden emin misin?"),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );
    await showDialog(
      context: context,
      builder: (ctx) {
        return alertDialog;
      },
    );
  }
}
