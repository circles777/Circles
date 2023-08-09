import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class EventCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String circleName;
  final String venue;
  final DateTime date;
  final String cost;
  final void Function()? onTap;
  const EventCard(
      {super.key,
      required this.image,
      required this.circleName,
      required this.title,
      required this.venue,
      required this.date,
      required this.cost,
      this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy年MM月dd日').format(date);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
    child:Container(
        width: 300,
        child: ClipRect(
            child: RowViewWithGap(gap: 8, children: <Widget>[
          Image(image: image, width: 100, ),
          ColumnViewWithGap(gap: 4, children: [
            Text(circleName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            RowViewWithGap(gap: 8, children: [
              Text(venue,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text(date_format,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text(cost,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ]),
          ])
        ])
        ))
        );
  }
}