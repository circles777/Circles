import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class SimpleEventCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String circleName;
  const SimpleEventCard(
      {super.key,
      required this.image,
      required this.title,
      required this.circleName});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        width: (deviceWidth - 16) / 2,
        child: ClipRect(
            child: RowViewWithGap(gap: 8, children: <Widget>[
          Avater(image: image),
          ColumnViewWithGap(gap: 4, children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(circleName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ])
        ])));
  }
}
