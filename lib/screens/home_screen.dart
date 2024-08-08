import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:notbook_todo/config/routes/routes.dart';
import 'package:notbook_todo/data/data.dart';
import 'package:notbook_todo/data/models/task.dart';
import 'package:notbook_todo/providers/providers.dart';
import 'package:notbook_todo/utils/utils.dart';
import 'package:notbook_todo/widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorSchema;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final unCompletedTasks = _uncompletedTasks(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Helpers.selectDate(context, ref),
                      child: DisplayWhiteText(
                        text: DateFormat.yMMMd().format(selectedDate),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const DisplayWhiteText(
                      text: 'Görev Listem',
                      fontSize: 40,
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(
                      tasks: unCompletedTasks,
                    ),
                    const Gap(20),
                    Text(
                      "Tamamlanan",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTask(
                      tasks: completedTasks,
                      isCompletedTask: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {
                          context.push(RouteLocation.createTask);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(text: "Yeni Görev Ekle"),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> fiteredTasks = [];

    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (task.isCompleted && isTaskDay) {
        fiteredTasks.add(task);
      }
    }
    return fiteredTasks;
  }

  List<Task> _uncompletedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> fiteredTasks = [];

    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        fiteredTasks.add(task);
      }
    }
    return fiteredTasks;
  }
}
