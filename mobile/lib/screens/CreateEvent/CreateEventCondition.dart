import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../components/event/EventList/EventDialog.dart';

class CreateEventCondition extends ConsumerWidget {
  CreateEventCondition({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateEventCondition(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  String? passwordValidator(String text) {
    if (text.length < 8) {
      return 'Please enter the password with at least 8 letters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "イベント作成",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  "終了",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ])),
      body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ColumnViewWithGap(
                gap: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: 1,
                    valueColor: const AlwaysStoppedAnimation(
                        Color.fromRGBO(61, 154, 239, 1)),
                    backgroundColor: const Color.fromRGBO(233, 233, 233, 1),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  ColumnViewWithGap(gap: 16, children: [
                    const Text(
                      "イベントの参加条件を設定してください",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        child: ColumnViewWithGap(
                      gap: 0,
                      children: [
                        GestureDetector(
                          onTap: () async {
                      final String? selectedText = await showDialog<String>(
                          context: context,
                          builder: (_) {
                            return EventDialog(title: "参加許可");
                          });
                    },
                       child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "参加許可",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "全員",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        )),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "学年",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "指定なし",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "性別",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "指定なし",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "大学",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "東京理科大学",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "学部",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "創域理工学部",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color:
                                          Color.fromRGBO(178, 178, 178, 1)))),
                          child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 18, right: 0, top: 10, bottom: 10),
                              child: RowViewWithGap(
                                  gap: 0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RowViewWithGap(gap: 10, children: [
                                      Text(
                                        "学科",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(7, 74, 131, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "電気電子情報工学科",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 166, 166, 1),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ]),
                                    Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: Color.fromRGBO(7, 74, 132, 1),
                                    )
                                  ])),
                        ),
                      ],
                    ))
                  ])
                ],
              ))),
    //ボトムバー
    bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(255, 255, 255, 1),
          surfaceTintColor: Colors.white,
          padding: EdgeInsets.all(0),
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromRGBO(220, 220, 220, 1), width: 1))),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(52, 170, 255, 1),
                      ),
                      child: Center(
                          child: Text(
                        "作成する",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  )))),
    );
  }
}
