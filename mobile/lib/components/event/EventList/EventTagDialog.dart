import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/Tag.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/screens/Forum/Forum_Categories.dart';

class EventTagDialog extends StatelessWidget {
  const EventTagDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tags = [
      'ビール',
      'ワイン',
      '日本酒',
      '焼酎',
      'ウィスキー',
      'ジン',
      'ウォッカ',
      '紹興酒',
      'マッコリ',
      'カクテル',
      '果実酒',
    ];
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SimpleDialog(
        title: ColumnViewWithGap(gap: 8, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                width: 41,
                height: 8,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(15)),
              )),
          Text(
            'タグ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          )
        ]),
        titlePadding: EdgeInsets.only(left: 24, top: 10),
        //contentPadding: EdgeInsets.only(),
        insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        alignment: Alignment.bottomCenter,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        children: [
          ColumnViewWithGap(gap: 0, children: [
            Container(
                width: deviceWidth,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 15),
                    child: Wrap(
                        spacing: 10,
                        runSpacing: 5,
                        children: List.generate(
                            16,
                            (index) =>
                                Tag(name: "テニス", backgroundColor: Colors.white))
                        //Tag(name: "テニス", backgroundColor: Colors.white),
                        ))),
            TextButton(
              child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
                      child: Container(
                          width: deviceWidth,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(52, 170, 255, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.only(
                              left: 5, top: 0, right: 5, bottom: 2),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('適用',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                          )))),
              onPressed: () {
                Navigator.pop(context, '');
              },
            ),
          ])
        ]);
  }
}
