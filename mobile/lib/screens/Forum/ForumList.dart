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
import 'package:mobile/components/common/FlexRow.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/Tag.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/forum/ForumCard.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class ForumList extends HookWidget {
  const ForumList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ForumList(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    return BaseLayout(
        title: "掲示板一覧",
        // body部分の画面のpaddingが全て8pxだから、一番上をpaddingで囲っていい
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ColumnViewWithGap(
            gap: 8,
            children: [
              FlexRow(children: [
                Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color:
                              Colors.black, //Color.fromRGBO(96, 125, 139, 1),
                          width: 3.0,
                        ))),
                        child: Center(
                          child: Text("新着",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color:
                              Colors.black, //Color.fromRGBO(96, 125, 139, 1),
                          width: 1.0,
                        ))),
                        child: Center(
                          child: Text("人気",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color:
                              Colors.black, //Color.fromRGBO(96, 125, 139, 1),
                          width: 1.0,
                        ))),
                        child: Center(
                          child: Text("検索",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        )))
              ]),
              ListViewWithGap(
                  gap: 0,
                  children: nums.map((n) {
                    return ForumCard(
                        date: DateTime.now(),
                        title: "一番狙い目の会社は?",
                        commentNum: 128,
                        goodNum: 37);
                  }).toList())
            ],
          ),
        ));
  }
}
