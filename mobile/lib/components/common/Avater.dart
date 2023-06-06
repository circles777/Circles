import 'dart:html';

import 'package:flutter/material.dart';

class Avater extends StatelessWidget {
  final ImageProvider image;
  final double? size;
  const Avater({super.key, required this.image, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 60,
      height: size ?? 60,
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
