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
  const ForumCommentCard({
    super.key,
    required this.date,
    required this.userName,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth - 16,
      child: RowViewWithGap(
          gap: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              Container(
                width: deviceWidth - 16 - 45 - 8,
                child: Text(content,
                    //overflow: TextOverflow.visible,*/
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              )
            ]),
          ]),
    );
  }
}
