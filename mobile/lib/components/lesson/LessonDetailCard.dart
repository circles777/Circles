import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/Tag.dart';

class LessonDetailCard extends StatelessWidget {
  final DateTime date;
  final String name;
  final List<String> tags;
  final int commentNum;

  const LessonDetailCard(
      {super.key,
      required this.date,
      required this.name,
      required this.tags,
      required this.commentNum});

  @override //StatelessWidget の内容つかうため
  Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    return (Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black, //Color.fromRGBO(96, 125, 139, 1),
          width: 1.0,
        ))),
        child: ColumnViewWithGap(gap: 4.0, children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date_format,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
              RowViewWithGap(gap: 4.0, children: [
                const Icon(Icons.chat,
                    size: 16, color: Color.fromARGB(255, 106, 106, 106)),
                Text(commentNum.toString(),
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600))
              ])
            ],
          ),
          Text(name,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Wrap(
              direction: Axis.horizontal,
              spacing: 4,
              runSpacing: 4,
              children: tags
                  .map((t) => Tag(
                      name: t,
                      backgroundColor: Color.fromARGB(161, 18, 189, 2)))
                  .toList())
        ])));
  }
}
