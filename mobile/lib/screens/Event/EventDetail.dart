// ignore_for_file: prefer_const_constructors

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

import '../../components/common/Tag.dart';

class EventDetail extends HookWidget {
  EventDetail({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EventDetail(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final inputUserName = useState<String>('');
    void onChangeUserNameInput(String text) {
      inputUserName.value = text;
    }

    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double deviceWidth = MediaQuery.of(context).size.width;
    return BaseLayout(
        title: 'イベント詳細',
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                child: ListViewWithGap(
                  gap: 8,
                  children: [
                    Text('飲み会',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  width: 1.0))),
                    ),
                    ColumnViewWithGap(gap: 8, children: [
                      Text('イベント情報',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      ColumnViewWithGap(gap: 4, children: <Widget>[
                        RowViewWithGap(gap: 8, children: [
                          Text('サークル名:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('キャンパーサークル',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('開催日:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('2022年6月22日',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('場所:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('東京都',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('定員:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('78人',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('参加費:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('7,000円',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        Text('詳細:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        Text(
                            '飲み会を通して親密になりながら私たちのサークルが行なっていることを知ってもらおうと思っています。ぜひご参加ください！',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        Text('タグ:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 4, // horizontal gap
                          runSpacing: 4, // vertical gap
                          children: [
                            Tag(
                                name: '飲み会',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'ゆったり',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'テキーラ',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'コール',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: '大人数',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: '一気飲み',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ColumnViewWithGap(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          gap: 8,
                          children: [
                            RowViewWithGap(
                                gap: 16,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("参加状況",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  //ここに追加
                                  //参加人数を表示
                                  //
                                  //
                                  //
                                  RowViewWithGap(
                                      gap: 0,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('8',
                                            style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 255, 65, 227))),
                                        Text('/78人',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                      ])
                                ]),
                            Container(
                              width: 64,
                              padding: EdgeInsets.only(
                                  top: 8, right: 12, bottom: 8, left: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(205, 237, 94, 250)),
                              child: Text(
                                '参加',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ])
                    ])
                  ],
                ))
          ],
        ));
  }
}
