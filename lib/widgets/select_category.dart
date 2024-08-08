import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:notbook_todo/providers/providers.dart';
import 'package:notbook_todo/utils/utils.dart';
import 'package:notbook_todo/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            "Kategori",
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    final category = categories[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      child: CircleContainer(
                          color: category.color.withOpacity(0.3),
                          child: Icon(category.icon,
                              color: category == selectedCategory
                                  ? context.colorSchema.primary
                                  : category.color)),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Gap(8);
                  },
                  itemCount: categories.length))
        ],
      ),
    );
  }
}
