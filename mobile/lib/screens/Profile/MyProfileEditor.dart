// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/EventCard.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/search/SearchEventListCard.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:mobile/utils/url/header.dart';
import 'package:mobile/screens/Profile/MyProfile.dart';

import '../../components/common/SquareCard.dart';
import '../../components/search/SearchEventHomeCard.dart';

class MyProfileEditor extends ConsumerWidget {
  final User user;

  MyProfileEditor({super.key, required this.user});

  static Route<dynamic> route({required User user}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MyProfileEditor(
        user: user,
      ),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(user.toJson());
    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    final double deviceWidth = MediaQuery.of(context).size.width;
    return BaseLayout(
        title: '',
        appBar: AppBar(toolbarHeight: 0),
        child: ListViewWithGap(horizontal: false, gap: 15, children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(user.photoUrl ?? 'public/momo.jpeg',
                      fit: BoxFit.cover)),
              Positioned(
                  top: 8,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.close, size: 24, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  top: 160,
                  left: 160,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.camera_alt_outlined,
                            size: 52, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 16, //Stackの第一子要素から相対的に
                  left: 10,
                  child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: MediaQuery.of(context).size.width -
                            20, // 画面の幅から20を引いた値を設定
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // 上下左右に8の余白を追加
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6), // 白色の背景を設定
                          borderRadius: BorderRadius.circular(40), // 角の丸みを40に設定
                        ),

                        child: Text(
                          '${user.lastName} ${user.firstName}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                      )))
            ],
          ),

          //多分ここからがプロフィール
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ColumnViewWithGap(
              gap: 12,
              children: [
                Text('プロフィール',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily:
                            'YourFontFamily')), //フォントの種類をこれで変更できるがあまり変わっていない

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '大学',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    user.university.toJP(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '学部',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    '${user.department}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '学科',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    '${user.faculty}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '性別',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    '${user.gender.toJP()}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '学年',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    '${user.grade}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '所在地',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Text(
                                    '${user.address.prefecture.toJP()} ${user.address.municipalities} ${user.address.houseNumber}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.75,
                                    ),
                                  ),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),

                Container(
                  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
                  child: ColumnViewWithGap(
                    gap: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'イベント',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF074A83),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 4), // すべての内容を左から4空ける
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4), // 右側に4のスペース
                                  child: Text(
                                    '${user.sanka}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  '参加',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(width: 8), // 8のスペース
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4), // 右側に4のスペース
                                  child: Text(
                                    '${user.kikaku}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  '企画',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(right: 8, left: 8), // 左に10の空白を追加
                    child: ColumnViewWithGap(
                        gap: 2,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ひとこと',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF074A83),
                            ),
                          ),
                          ColumnViewWithGap(gap: 0, children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F1F3), // 背景色を青色に設定
                                borderRadius:
                                    BorderRadius.circular(10), // 角丸を適用する場合
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 12), // マークを追加するためのパディング
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween, // マークを右端に配置
                                children: [
                                  Expanded(
                                      child: Text(
                                    '${user.introduction}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  )),

                                  Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    size: 28.0,
                                  ), //
                                ],
                              ),
                            ),
                          ])
                        ])),
              ],
            ),
          ),

/*
                RowViewWithGap(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_outline,
                        size: 19, color: Colors.black),
                    Text('${user.grade}年',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                        size: 19, color: Colors.black),
                    Text('${user.address.prefecture.toJP()}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                    gap: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_border,
                          size: 19, color: Colors.black),
                      Text('4参加', // ToDo: 今までの参加イベントの数を表示
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('1企画', // ToDo: 今までの参加イベントの数を表示
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ]),
              ],
            ),
          ),
             //ここまでがプロフィール
*/

          ColumnViewWithGap(
            gap: 4,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'マイタグ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0C2D49),
                      ),
                    ) // テキストの色を指定)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 16, left: 8, right: 8),  //MyProfileとbottom共通で16
                padding: EdgeInsets.only(left: 16, right: 4, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SizedBox(
                  width: double.infinity, // 親コンテナの幅をいっぱいに広げる
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // マークを右端に配置
                    children: [
                      Expanded(
                          child: Wrap(spacing: 4, runSpacing: 4,
                          children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'テニス', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'バレー', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'よく話す', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        '活発', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        '一人暮らし', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'テニス', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'バレー', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        'よく話す', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        '活発', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        border: Border.all(
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ), // 枠線を青色に設定),
                      child: const Text(
                        '一人暮らし', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(123, 140, 153, 1),
                        ),
                      ),
                    ),]
                    )
                    ),

                      Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        size: 28.0,
                      ), //
                    ],
                  ),

    
                ),
              ),
            ],
          ),



        ]));
  }
}
