// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.color,
    this.child,
  });
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(width: 2, color: color),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
