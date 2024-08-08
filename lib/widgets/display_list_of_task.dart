// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notbook_todo/data/data.dart';
import 'package:notbook_todo/providers/providers.dart';
import 'package:notbook_todo/utils/utils.dart';
import 'package:notbook_todo/widgets/widgets.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTask = false,
  });

  final List<Task> tasks;
  final bool isCompletedTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTask ? "Henüz tamamlanan görev yok" : "Yapılacak görev yok";
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                    onLongPress: () {
                      AppAlerts.showDeleteAlertdialog(context, ref, task);
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        },
                      );
                    },
                    child: TaskTile(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then(
                          (value) {
                            AppAlerts.displaySnackBar(
                                context,
                                task.isCompleted
                                    ? "Görev tamamlanmadı "
                                    : "Görev tamamlandı");
                          },
                        );
                      },
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
