import 'dart:html';

import 'package:flutter/material.dart';

class ListViewWithGap extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  final bool? horizontal;
  const ListViewWithGap(
      {super.key, required this.gap, required this.children, this.horizontal});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: (horizontal == true) ? Axis.horizontal : Axis.vertical,
      shrinkWrap: true, //高さ指定が必要なくなる
      children: children.map((child) {
        return Padding(
          padding: (horizontal == true)
              ? EdgeInsets.only(right: gap)
              : EdgeInsets.only(bottom: gap),
          child: child,
        );
      }).toList(),
    );
  }
}
