// ignore_for_file: prefer_const_constructors

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
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

class SearchEventHome extends ConsumerWidget {
  SearchEventHome({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => SearchEventHome(),
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
    final double deviceWidth = MediaQuery.of(context).size.width;
    return BaseLayout(
        title: 'ホーム',
        child: ListViewWithGap(horizontal: false, gap: 8, children: [
          // おすすめサークル
          ColumnViewWithGap(gap: 8, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('おすすめ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      onTap: () => {}, // ToDO: すべて表示をタップした時の動作を追加
                      child: Text('すべて表示',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 61, 153, 239))),
                    )),
              ],
            ),
            Container(
                height: 240,
                padding: EdgeInsets.only(left: 0),
                child: ListViewWithGap(
                  gap: 8,
                  horizontal: true,
                  children: nums.map((key) {
                    return SearchEventHomeCard(event: mockEvent);
                  }).toList(),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromRGBO(
                      166, 166, 166, 1), //Color.fromRGBO(96, 125, 139, 1),
                  width: 1.0,
                ))),
              ),
            )
          ]),
          ColumnViewWithGap(gap: 8, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('人気',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      onTap: () => {}, // ToDO: すべて表示をタップした時の動作を追加
                      child: Text('すべて表示',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 61, 153, 239))),
                    )),
              ],
            ),
            Container(
                height: 240,
                padding: EdgeInsets.only(left: 0),
                child: ListViewWithGap(
                  gap: 8,
                  horizontal: true,
                  children: nums.map((key) {
                    return SearchEventHomeCard(event: mockEvent);
                  }).toList(),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromRGBO(
                      166, 166, 166, 1), //Color.fromRGBO(96, 125, 139, 1),
                  width: 1.0,
                ))),
              ),
            )
          ]),
          ColumnViewWithGap(gap: 8, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('同じ学科',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600))),
                Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: GestureDetector(
                      onTap: () => {}, // ToDO: すべて表示をタップした時の動作を追加
                      child: Text('すべて表示',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 61, 153, 239))),
                    )),
              ],
            ),
            Container(
                height: 240,
                padding: EdgeInsets.only(left: 0),
                child: ListViewWithGap(
                  gap: 8,
                  horizontal: true,
                  children: nums.map((key) {
                    return SearchEventHomeCard(event: mockEvent);
                  }).toList(),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color.fromRGBO(
                      166, 166, 166, 1), //Color.fromRGBO(96, 125, 139, 1),
                  width: 1.0,
                ))),
              ),
            )
          ]),
          Container(
              height: 500,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.8,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                opacity: 0.5,
                                image:
                                    AssetImage('public/category/sports.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text(
                          'スポーツ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  opacity: 0.5,
                                  image:
                                      AssetImage('public/category/food.jpeg'),
                                  fit: BoxFit.cover)),
                          child: Text(
                            'グルメ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                opacity: 0.5,
                                image: AssetImage('public/category/music.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text(
                          '音楽/フェス',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                opacity: 0.5,
                                image: AssetImage('public/category/drink.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text(
                          '飲み会',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                opacity: 0.5,
                                image: AssetImage('public/category/art.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text(
                          'アート',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                opacity: 0.5,
                                image:
                                    AssetImage('public/category/science.jpeg'),
                                fit: BoxFit.cover)),
                        child: Text(
                          'サイエンス',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ]))
        ]));
  }
}
