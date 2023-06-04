import 'dart:html';

import 'package:flutter/material.dart';

class Avater extends StatelessWidget {
  final ImageProvider image;
  const Avater({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
