import 'dart:html';

import 'package:flutter/material.dart';

class RowViewWithGap extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  const RowViewWithGap({super.key, required this.gap, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children.map((child) {
        return Padding(
          padding: EdgeInsets.only(right: gap),
          child: child,
        );
      }).toList(),
    );
  }
}
