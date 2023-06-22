import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class ForumCard extends StatelessWidget {
  final DateTime date;
  final String title;
  final int commentNum;
  final int goodNum;
  const ForumCard(
      {super.key,
      required this.date,
      required this.title,
      required this.commentNum,
      required this.goodNum});

  @override
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black, //Color.fromRGBO(96, 125, 139, 1),
          width: 1.0,
        ))),
        child: ColumnViewWithGap(
          gap: 4,
          children: [
            Text(date_format,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Text(title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            RowViewWithGap(gap: 8, children: [
              RowViewWithGap(gap: 4, children: [
                Icon(Icons.chat,
                    size: 16, color: Color.fromARGB(255, 106, 106, 106)),
                Text(commentNum.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
              ]),
              RowViewWithGap(gap: 4, children: [
                Icon(CupertinoIcons.heart_fill, size: 16, color: Colors.red),
                Text(goodNum.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
              ])
            ])
          ],
        ));
  }
}
