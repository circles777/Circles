import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class ForumDetailCard extends StatelessWidget {
  final DateTime date;
  final String title;
  final String content;
  final int goodNum;
  const ForumDetailCard(
      {super.key,
      required this.date,
      required this.title,
      required this.content,
      required this.goodNum});

  @override
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black, //Color.fromRGBO(96, 125, 139, 1),
          width: 1.0,
        ))),
        child: ColumnViewWithGap(
          gap: 16,
          children: [
            ColumnViewWithGap(gap: 4, children: [
              Text(date_format,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ]),
            ColumnViewWithGap(gap: 8, children: [
              Flexible(
                  child: Text(content,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))),
              RowViewWithGap(gap: 4, children: [
                Icon(CupertinoIcons.heart_fill, size: 20, color: Colors.red),
                Text(goodNum.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
              ])
            ])
          ],
        ));
  }
}
