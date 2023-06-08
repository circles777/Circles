import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile/screens/Circle/CircleDetail.dart';

class Tag extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final void Function()? onTap;
  const Tag(
      {super.key,
      required this.name,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4, left: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: Text(name,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 255, 255, 255))),
      ),
    );
  }
}
