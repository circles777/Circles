// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:developer';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/event/EventDialog.dart';
import 'package:mobile/components/event/EventList/EventSortLocation.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('イベント'),
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
          child: ColumnViewWithGap(gap: 8, children: [
            Text(event.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(7, 74, 131, 1))),
            RowViewWithGap(
              gap: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                    size: 18, color: Colors.black),
                Text(
                    '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
            RowViewWithGap(
              gap: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(IconData(0xef11, fontFamily: 'MaterialIcons'),
                    size: 18, color: Colors.black),
                Text(start_format,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
            RowViewWithGap(gap: 22, children: [
              RowViewWithGap(
                gap: 8,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconData(0xe491, fontFamily: 'MaterialIcons'),
                      size: 18, color: Colors.black),
                  Text(
                      '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500))
                ],
              ),
              RowViewWithGap(gap: 5, children: [
                GestureDetector(
                  onTap: () => {},
                  child: const Icon(Icons.favorite_border,
                      size: 18, color: Color.fromRGBO(248, 6, 6, 1)),
                ),
                const Text(
                  '7', //ToDo: お気に入りの数を実装
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(87, 87, 87, 1)),
                )
              ])
            ]),
            //参加条件
             GestureDetector(
                    onTap: () {
                      showDialog<void>(
          context: context,
          builder: (_) {
            return EventDialog(title: "このイベントの参加条件",);
                    },
                  );
                    },
                    child: RowViewWithGap(gap: 12, children: [
                      const Icon(Icons.error_outline,
                          size: 18, color: Color.fromRGBO(248, 6, 6, 1)),
                          Container(
                            width: 220,
                      child:  Text(
                        "招待制　3年生のみ　女性のみ　東京理科大学",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(248, 6, 6, 1)),
                        overflow: TextOverflow.ellipsis,
                      ))
                    ])),
            //タグ
            Container(
              width: deviceWidth,
              child: Wrap(spacing: 10, runSpacing: 5, children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 1),
                    borderRadius: BorderRadius.circular(24),
                    /*border: Border.all(
                            color: Color.fromRGBO(123, 140, 153, 1),
                            width: 1)*/
                  ),
                  padding:
                      EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
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
                  padding:
                      EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
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
                  padding:
                      EdgeInsets.only(left: 8, top: 2, right: 8, bottom: 2),
                  child: Text('スポーツ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(61, 154, 239, 1))),
                )
              ]),
            )
          ]),
        ),
        Container(
            width: deviceWidth - 16,
            margin: EdgeInsets.only(left: 0, right: 0),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: ColumnViewWithGap(
              gap: 8,
              children: [
                Text(event.detail,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
        Container(
            width: deviceWidth - 16,
            margin: EdgeInsets.only(left: 0, right: 0),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: ColumnViewWithGap(gap: 8, children: [
              const Text('主催者(1)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              RowViewWithGap(gap: 8, children: [
                Avater(
                    size: 40,
                    image: AssetImage(
                        event.creator.photoUrl ?? 'public/mican.jpeg')),
                ColumnViewWithGap(gap: 4, children: [
                  Text('${event.creator.lastName} ${event.creator.firstName}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  Text(
                    event.creator.university.toJP(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  )
                ])
              ]),
              const Text('参加者(5)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
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
                                    image: AssetImage(u.value.user.photoUrl ??
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
                                      color:
                                          Color.fromARGB(255, 217, 217, 217)),
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
                      []),
              //関連するイベント
              Text(
                "関連するイベント",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                  height: 270,
                  padding: EdgeInsets.only(left: 0),
                  child: ListViewWithGap(
                    gap: 8,
                    horizontal: true,
                    children: nums.map((key) {
                      return SearchEventHomeCard(
                        event: mockEvent11,
                      );
                    }).toList(),
                  ))
            ])),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedFontSize: 10,
        selectedLabelStyle: TextStyle(color: Color.fromRGBO(118, 118, 118, 1)),
        selectedItemColor: Color.fromRGBO(118, 118, 118, 1),
        items: [
          BottomNavigationBarItem(
              icon: LikeButton(
                size: 30,
              ),
              label: "お気に入り"),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(52, 170, 255, 1),
                ),
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                child: Text(
                  "イベントに参加する",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
