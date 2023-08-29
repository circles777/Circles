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

class Mypage extends HookWidget {
  const Mypage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Mypage(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: "マイページ",
        // body部分の画面のpaddingが全て8pxだから、一番上をpaddingで囲っていい
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ColumnViewWithGap(gap: 8, children: [
            RowViewWithGap(
                gap: 8,
                crossAxisAlignment: CrossAxisAlignment.start, //ここで上揃いにする
                children: [
                  Avater(
                    size: 80,
                    image: AssetImage('public/mican.jpeg'),
                  ),
                  ColumnViewWithGap(gap: 8, 
                  children: [
                    Text('satou839',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(166, 166, 166, 1))),
                    Text('佐藤 太郎',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1))),
                  ]),
                ]),
            //自己紹介

            Text('東京理科大学の大学1年生です。\nサークルを探すためにこのアプリを\n入れました。\nよろしくお願いいたします。',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 1))),

            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
              color: Color.fromRGBO(
                  166, 166, 166, 1), //Color.fromRGBO(96, 125, 139, 1),
              width: 1.0,
            )))),

            //ユーザー情報
            ColumnViewWithGap(gap: 8, children: [
              Text('基本情報',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1))),
              RowViewWithGap(gap: 8, children: [
                Text('学校名:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                Text('東京理科大学',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)))
              ]),
              RowViewWithGap(gap: 8, children: [
                Text('生年月日:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                Text('2002年8月22日',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)))
              ]),
              RowViewWithGap(gap: 8, children: [
                Text('性別:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                Text('男性',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)))
              ]),
              RowViewWithGap(gap: 8, children: [
                Text('所属サークル:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                Text('なし',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)))
              ]),
              RowViewWithGap(gap: 8, children: [
                Text('希望項目:',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1))),
                Text('',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1)))
              ])
            ]),

            //タグ
            Wrap(
                direction: Axis.horizontal,
                spacing: 4, // horizontal gap
                runSpacing: 4,
                children: [
                  Tag(
                      name: 'キャンピング',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: 'アウトドア',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: '自然',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: 'ゆったり',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: '自然',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: 'キャンピング',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: 'ゆったり',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                  Tag(
                      name: 'アウトドア',
                      backgroundColor: Color.fromRGBO(68, 165, 255, 0.8)),
                ])
          ]),
        ));
  }
}
