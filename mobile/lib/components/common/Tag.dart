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
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1)),
          color: backgroundColor,
        ),
        child: Text(name,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(123, 140, 153, 1))),
      ),
    );
  }
}
