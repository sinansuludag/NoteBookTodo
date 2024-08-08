import 'package:flutter/material.dart';

import 'package:notbook_todo/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  const CommonContainer({
    super.key,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
        width: deviceSize.width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.colorSchema.primaryContainer),
        child: child);
  }
}
