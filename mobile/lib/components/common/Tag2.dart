import 'package:flutter/material.dart';
import 'package:mobile/screens/Circle/CircleDetail.dart';

class Tag2 extends StatelessWidget {
  final String name;
  final bool isActive;
  final void Function()? onTap;
  const Tag2(
      {super.key, required this.name, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: isActive ? Color.fromARGB(255, 17, 121, 206) : null,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: isActive
                      ? Color.fromARGB(255, 17, 121, 206)
                      : Color.fromARGB(255, 123, 140, 153),
                  width: 1)),
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Text(name,
              style: TextStyle(
                  fontSize: 16,
                  color: isActive
                      ? Colors.white
                      : Color.fromARGB(255, 123, 140, 153))),
        ));
  }
}
