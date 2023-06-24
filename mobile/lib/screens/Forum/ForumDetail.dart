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
import 'package:mobile/components/common/Tag.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/forum/ForumCommentCard.dart';
import 'package:mobile/components/forum/ForumDetailCard.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/constants/constants.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class ForumDetail extends HookWidget {
  final DateTime date;
  final String title;
  final String content;
  final int goodNum;

  ForumDetail(
      {super.key,
      required this.date,
      required this.title,
      required this.content,
      required this.goodNum});

  static Route<dynamic> route(
      {required DateTime date,
      required String title,
      required String content,
      required int goodNum}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ForumDetail(
        date: date,
        title: title,
        content: content,
        goodNum: goodNum,
      ),
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

    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    final double deviceHeight = MediaQuery.of(context).size.height;
    return BaseLayout(
      title: '掲示板詳細',
      child: Padding(
          padding: EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Container(
            height: deviceHeight - heightOfHeaderAndBottomNav - 8,
            child: ListViewWithGap(
              gap: 16,
              children: [
                ForumDetailCard(
                    date: date,
                    title: title,
                    content: content,
                    goodNum: goodNum),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: ColumnViewWithGap(
                      gap: 8,
                      children: nums.map((n) {
                        return ForumCommentCard(
                            date: date,
                            userName: "satou845",
                            content:
                                "不動産業界だったら大塚商会がおすすめです。大量に新卒枠ありますし、倍率もそこそこです。");
                      }).toList()),
                )
              ],
            ),
          )),
    );
  }
}
