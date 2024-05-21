import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/search/SearchEventHomeCard.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/models/event.model.dart';

class EventEdit extends ConsumerWidget {
  final EventModel event;
  EventEdit({super.key, required this.event});

  static Route<dynamic> route({required EventModel event}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EventEdit(event: event),
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
  Widget build(BuildContext context, WidgetRef ref) {
    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    String start_format =
        DateFormat('yyyy/MM/dd hh:mm〜').format(event.startedAt);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('編集'),
        backgroundColor: Colors.white,
      ),
      body: ListViewWithGap(horizontal: false, gap: 0, children: [
        AspectRatio(
            aspectRatio: 1.6,
            child: Image.asset(event.photoUrl, fit: BoxFit.cover)),
        Container(
          margin: EdgeInsets.only(left: 0, right: 0),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: ColumnViewWithGap(gap: 16, children: [
            Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(240, 241, 243, 1)),
                padding: EdgeInsets.all(10),
                child: Text(event.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(7, 74, 131, 1)))),
            Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(240, 241, 243, 1)),
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowViewWithGap(
                        gap: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                              IconData(0xf193, fontFamily: 'MaterialIcons'),
                              size: 18,
                              color: Colors.black),
                          Text(
                              '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Icon(
                        (Icons.keyboard_arrow_right),
                        size: 24,
                        color: Color.fromRGBO(166, 166, 166, 1),
                      )
                    ])),
            Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(240, 241, 243, 1)),
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowViewWithGap(
                        gap: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                              IconData(0xef11, fontFamily: 'MaterialIcons'),
                              size: 18,
                              color: Colors.black),
                          Text(start_format,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Icon(
                        (Icons.keyboard_arrow_right),
                        size: 24,
                        color: Color.fromRGBO(166, 166, 166, 1),
                      )
                    ])),
            //タグ
            Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(240, 241, 243, 1)),
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(spacing: 10, runSpacing: 5, children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          borderRadius: BorderRadius.circular(24),
                          /*border: Border.all(
                            color: Color.fromRGBO(123, 140, 153, 1),
                            width: 1)*/
                        ),
                        padding: EdgeInsets.only(
                            left: 8, top: 2, right: 8, bottom: 2),
                        child: Text('東京理科大学',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(61, 154, 239, 1))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          borderRadius: BorderRadius.circular(24),
                          /*border: Border.all(
                            color: Color.fromARGB(255, 123, 140, 153),
                            width: 1)*/
                        ),
                        padding: EdgeInsets.only(
                            left: 8, top: 2, right: 8, bottom: 2),
                        child: Text('テニス',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(61, 154, 239, 1))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 233, 233, 1),
                          borderRadius: BorderRadius.circular(24),
                          /*border: Border.all(
                            color: Color.fromARGB(255, 123, 140, 153),
                            width: 1*/
                        ),
                        padding: EdgeInsets.only(
                            left: 8, top: 2, right: 8, bottom: 2),
                        child: Text('スポーツ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(61, 154, 239, 1))),
                      )
                    ]),
                    Icon(
                      (Icons.keyboard_arrow_right),
                      size: 24,
                      color: Color.fromRGBO(166, 166, 166, 1),
                    )
                  ]),
            ),

            Container(
                width: deviceWidth,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 241, 243, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ColumnViewWithGap(
                  gap: 8,
                  children: [
                    Text(event.detail,
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    GestureDetector(
                      onTap: () => {},
                      child: Text('もっと読む',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(61, 154, 239, 1))),
                    )
                  ],
                )),
          ]),
        ),
      ]),
    );
  }
}
