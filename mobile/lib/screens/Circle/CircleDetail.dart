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
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class CircleDetail extends HookWidget {
  CircleDetail({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CircleDetail(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  final _formKey = GlobalKey<FormState>();
  String? passwordValidator(String text) {
    if (text.length < 8) {
      return 'Please enter the password with at least 8 letters';
    }
    return null;
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
        title: 'サークル詳細',
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: deviceWidth * (250 / 400),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('public/circle1.jpg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: ListViewWithGap(
                  gap: 12,
                  children: [
                    Text('キャンパーサークル',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  width: 1.0))),
                    ),
                    Text(
                        "私たちは日本各地でキャンピングをしている自然が大好きなキャンプ愛好家たちが集まったサークルです。このサークルが設立されて8年になりますが、これまで関東近辺もちろんのこと、東北、四国、九州、北海道と日本全国でキャンプをしてきました。 キャンプする際にはみんなが楽しめるような数多くのレクリエーションがあるので、ぜひ体験で説明会に来てみてください！",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    ColumnViewWithGap(gap: 8, children: [
                      Text('基本情報',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      ColumnViewWithGap(gap: 4, children: <Widget>[
                        RowViewWithGap(gap: 8, children: [
                          Text('大学:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('東京理科大学',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('設立日:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('2015年3月',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('場所:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('東京都 港区 7-3-4',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('お問合せ:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('0120-123-4567',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        RowViewWithGap(gap: 8, children: [
                          Text('所属人数:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          Text('78人(2022年12月時点)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400))
                        ]),
                        Text('タグ:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 4, // horizontal gap
                          runSpacing: 4, // vertical gap
                          children: [
                            Tag(
                                name: 'キャンプ',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'ゆったり',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'アウトドア',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: '自然',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: '大人数',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255)),
                            Tag(
                                name: 'みんなでワイワイ',
                                backgroundColor:
                                    Color.fromARGB(208, 68, 165, 255))
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Center(
                          child: Container(
                            width: 64,
                            padding: EdgeInsets.only(
                                top: 8, right: 12, bottom: 8, left: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(205, 237, 94, 250)),
                            child: Text(
                              '予約',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ])
                    ])
                  ],
                ))
          ],
        ));
  }
}
