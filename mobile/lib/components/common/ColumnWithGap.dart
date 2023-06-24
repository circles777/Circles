import 'dart:html';

import 'package:flutter/material.dart';

class ColumnViewWithGap extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const ColumnViewWithGap(
      {super.key,
      required this.gap,
      required this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: children.map((child) {
        final index = children.indexWhere((element) => element == child);
        return Padding(
          padding:
              EdgeInsets.only(bottom: (index + 1) == children.length ? 0 : gap),
          child: child,
        );
      }).toList(),
    );
  }
}
