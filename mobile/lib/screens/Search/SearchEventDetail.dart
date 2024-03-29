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

import '../../components/search/SearchEventHomeCard.dart';

class SearchEventDetail extends ConsumerWidget {
  final EventModel event;

  SearchEventDetail({super.key, required this.event});

  static Route<dynamic> route({required EventModel event}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => SearchEventDetail(
        event: event,
      ),
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
    return BaseLayout(
        title: '',
        appBar: AppBar(toolbarHeight: 0),
        child: ListViewWithGap(horizontal: false, gap: 8, children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 1.6,
                  child: Image.asset(event.photoUrl, fit: BoxFit.cover)),
              Positioned(
                  top: 8,
                  left: 8,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.arrow_back,
                            size: 20, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.more_horiz,
                            size: 20, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  top: 8,
                  right: 46,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.file_download,
                            size: 20, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  top: 8,
                  right: 84,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.bookmark_border_outlined,
                            size: 20, color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ColumnViewWithGap(
              gap: 8,
              children: [
                Text(event.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                RowViewWithGap(
                  gap: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                        size: 16, color: Colors.black),
                    Text(
                        '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                  gap: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xef11, fontFamily: 'MaterialIcons'),
                        size: 16, color: Colors.black),
                    Text(start_format,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                  gap: 8,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xe491, fontFamily: 'MaterialIcons'),
                        size: 16, color: Colors.black),
                    Text(
                        '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: deviceWidth - 16,
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ColumnViewWithGap(
                gap: 8,
                children: [
                  Text('紹介',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Text(event.detail,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: () => {},
                    child: Text('もっと読む',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 34, 182, 245))),
                  )
                ],
              )),
          Container(
              width: deviceWidth - 16,
              margin: EdgeInsets.only(left: 8, right: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ColumnViewWithGap(
                gap: 8,
                children: [
                  const Text('ホスト',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  RowViewWithGap(gap: 8, children: [
                    Avater(
                        size: 40,
                        image: AssetImage(
                            event.creator.photoUrl ?? 'public/mican.jpeg')),
                    ColumnViewWithGap(gap: 4, children: [
                      Text(
                          '${event.creator.lastName} ${event.creator.firstName}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700)),
                      Text(
                        event.creator.university!.university.displayName,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      )
                    ])
                  ]),
                  const Text('参加者',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  Stack(
                      //alignment: AlignmentDirectional.centerStart,
                      //fit: StackFit.loose,
                      children: event.userBookedEvents?.asMap().entries.map(
                            (u) {
                              if (u.key <= 2) {
                                return Align(
                                    alignment: Alignment(
                                        -1 + (35 / deviceWidth) * 2 * u.key,
                                        0), // 横軸は-1~1の範囲で決まる(左はそれを考慮して計算)
                                    child: Avater(
                                        size: 40,
                                        image: AssetImage(
                                            u.value.user.photoUrl ??
                                                'public/mican.jpeg')));
                              } else if (u.key == 3) {
                                return Align(
                                    alignment: Alignment(
                                        -1 + (35 / deviceWidth) * 2 * u.key,
                                        0), // 横軸は-1~1の範囲で決まる(左はそれを考慮して計算)
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 217, 217, 217)),
                                      child: Text(
                                        '+${(event.userBookedEvents?.length ?? 3) - 3}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ));
                              } else {
                                return Container(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            },
                          ).toList() ??
                          [])
                ],
              ))
        ]));
  }
}
