// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notbook_todo/data/data.dart';
import 'package:notbook_todo/utils/extensions.dart';
import 'package:notbook_todo/utils/task_categories.dart';
import 'package:notbook_todo/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final deviceSize = context.deviceSize;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        height: deviceSize.height * 0.4,
        child: Column(
          children: [
            CircleContainer(
              color: task.category.color.withOpacity(0.3),
              child: Icon(task.category.icon, color: task.category.color),
            ),
            const Gap(16),
            Text(
              task.title,
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(task.time, style: style.titleMedium),
            const Gap(16),
            Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${task.date}  tarihinde bu görev tamamlanmış olacak "),
                  Icon(
                    Icons.check_box,
                    color: task.category.color,
                  )
                ],
              ),
            ),
            const Gap(16),
            Divider(
              thickness: 1.5,
              color: task.category.color,
            ),
            const Gap(16),
            Text(task.note.isEmpty
                ? "Bu görev için eklenilecek bir not yok"
                : task.note),
            const Gap(16),
            Visibility(
              visible: task.isCompleted,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Görev tamamlandı"),
                  Icon(
                    Icons.check_box,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
