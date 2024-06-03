import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/models/common/enums.dart';

Future<void> EventSortDate(
  BuildContext context, {
  required String title,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    elevation: 0,
    builder: (context) {
      final double deviceWidth = MediaQuery.of(context).size.width;
      return Container(
          height: 300,
          child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 8,
                    ),
                    ColumnViewWithGap(gap: 16, children: [
                      GestureDetector(
                          child: Text("全て",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))),
                      GestureDetector(
                          child: Text("今日",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))),
                      GestureDetector(
                          child: Text("今週",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))),
                      GestureDetector(
                          child: Text("今月",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))),
                      GestureDetector(
                          child: Text("日時を選択",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400))),
                      Container(
                          child: TextButton(
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: deviceWidth - 40,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(52, 170, 255, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('適用',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1))),
                                ))),
                        onPressed: () {
                          Navigator.pop(context, '');
                        },
                      ))
                    ]),
                  ])));
    },
  );
}
