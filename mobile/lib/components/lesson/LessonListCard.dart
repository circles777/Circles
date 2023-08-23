import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/Tag.dart';

class LessonListCard extends StatelessWidget {
  final DateTime date;
  final String name;
  final List<String> tags;
  final int commentNum;
  final Color color;


  const LessonListCard(
      {super.key,
      required this.date,
      required this.name,
      required this.tags,
      required this.commentNum,
      required this.color});

@override 
 Widget build(BuildContext context) {
    String date_format = DateFormat('yyyy/MM/dd').add_jms().format(date);
    return (Container(
      padding:EdgeInsets.all(8),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black, 
          width: 1.0,),
      ),
      child: ColumnViewWithGap(gap: 4, children: <Widget>[
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
                      backgroundColor: color))
                  .toList())
      ]
      ,)
      ,
    ));
 }
}