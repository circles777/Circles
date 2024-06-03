import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/models/common/enums.dart';

Future<void> EventSortLocation(
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
      return Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: Prefecture.values.length,
              itemBuilder: (context, index) {
                final prefecture = Prefecture.values[index];
                return GestureDetector(
                  onTap: () {},
                  child: ColumnViewWithGap(gap: 0, children: [
                    Text(
                      prefecture.toJP(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ]),
                );
              },
            )),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
            child:TextButton(
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
            )),
          ]));
    },
  );
}
