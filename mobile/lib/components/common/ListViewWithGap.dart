import 'dart:html';

import 'package:flutter/material.dart';

class ListViewWithGap extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  final bool? horizontal;
  const ListViewWithGap({
    super.key,
    required this.gap,
    required this.children,
    this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: (horizontal == true) ? Axis.horizontal : Axis.vertical,
      shrinkWrap: true, //高さ指定が必要なくなる
      children: children.map((child) {
        final index = children.indexWhere((element) => element == child);
        final bool flag = index + 1 == children.length;
        return Padding(
          padding: (horizontal == true)
              ? EdgeInsets.only(right: flag ? gap : 0)
              : EdgeInsets.only(bottom: flag ? gap : 0),
          child: child,
        );
      }).toList(),
    );
  }
}
