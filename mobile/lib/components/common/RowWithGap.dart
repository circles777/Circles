import 'dart:html';

import 'package:flutter/material.dart';

class RowViewWithGap extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const RowViewWithGap(
      {super.key,
      required this.gap,
      required this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: children.map((child) {
        return Padding(
          padding: EdgeInsets.only(right: gap),
          child: child,
        );
      }).toList(),
    );
  }
}
