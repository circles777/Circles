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

import '../../components/common/SquareCard.dart';
import '../../components/search/SearchEventHomeCard.dart';

class MyProfile extends ConsumerWidget {
  final User user;

  MyProfile({super.key, required this.user});

  static Route<dynamic> route({required User user}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MyProfile(
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
        child: ListViewWithGap(horizontal: false, gap: 8, children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(user.photoUrl ?? 'public/mican.jpeg',
                      fit: BoxFit.cover)),
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
                        child: Icon(Icons.close, size: 20, color: Colors.white),
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
                        child:
                            Icon(Icons.settings, size: 20, color: Colors.white),
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
                        child: Icon(Icons.border_color,
                            size: 20, color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 8, //Stackの第一子要素から相対的に
                  left: 8,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Text(
                      '${user.lastName} ${user.firstName}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ColumnViewWithGap(
              gap: 8,
              children: [
                Text('プロフィール',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                RowViewWithGap(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Icon(Icons.school_outlined,
                          size: 19, color: Colors.black),
                    ),
                    ColumnViewWithGap(gap: 4, children: [
                      Text(user.university.toJP(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('${user.faculty}-${user.department}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500))
                    ]),
                  ],
                ),
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
          ColumnViewWithGap(gap: 4, children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('参加したイベント',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () => {},
                    child: Text('すべて表示',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 61, 153, 239))),
                  ),
                ],
              ),
            ),
            Container(
              height: 210,
              child: ListViewWithGap(
                  gap: 0,
                  horizontal: true,
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: EventCard(event: mockEvent11),
                          ))),
            )
          ]),
          ColumnViewWithGap(gap: 4, children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('所属中の広場',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () => {},
                    child: Text('すべて表示',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 61, 153, 239))),
                  ),
                ],
              ),
            ),
            Container(
              height: 260,
              child: ListViewWithGap(
                  gap: 0,
                  horizontal: true,
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: SquareCard(square: mockSquare11),
                          ))),
            )
          ]),
        ]));
  }
}
