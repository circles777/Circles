import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class ForumCommentCard extends StatelessWidget {
  final DateTime date;
  final String userName;
  final String content;
  final int goodNum;
  const ForumCommentCard(
      {super.key,
      required this.date,
      required this.userName,
      required this.content,
      required this.goodNum});

  @override
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return RowViewWithGap(gap: 8, children: [
      Avater(size: 45, image: AssetImage("../../../public/mican.jpeg")),
      ColumnViewWithGap(gap: 4, children: [
        RowViewWithGap(gap: 8, children: [
          Text(userName,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(166, 166, 166, 1))),
          Text(date_format,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
        ]),
        Flexible(
            child: Text(content,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)))
      ])
    ]);
  }
}
