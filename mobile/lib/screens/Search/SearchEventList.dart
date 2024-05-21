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
import 'package:mobile/components/event/EventDialog.dart';
import 'package:mobile/components/event/EventListCard.dart';
import 'package:mobile/components/event/EventSort.dart';
import 'package:mobile/components/search/SearchEventListCard.dart';
import 'package:mobile/components/search/SearchEventSort.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/university.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:mobile/utils/url/header.dart';

import '../../components/event/EventTagDialog.dart';
import '../../components/search/SearchEventHomeCard.dart';
import 'SearchEventDetail.dart';

class SearchEventList extends HookWidget {
  SearchEventList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => SearchEventList(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Container(
            width: 300,
            height: 35,
            child: TextField(
                decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              hintText: '検索',
              hintStyle: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(175, 175, 175, 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              fillColor: Color.fromRGBO(238, 238, 238, 1),
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: const Color.fromRGBO(175, 175, 175, 1),
                size: 24,
              ),
            ))),
        floating: true, //スクロールしたら非表示にする
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white, //スクロール中のアップバーの色
          ),
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: SizedBox(
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14, bottom: 5),
                child: ListViewWithGap(horizontal: true, gap: 8, children: [
                  Icon(
                    Icons.format_list_bulleted,
                    color: Colors.black,
                    size: 24,
                  ),
                  SearchEventSort(
                    name: "並び替え",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "並び替え", context, actions: [
                        ActionItem(text: "人気順"),
                        ActionItem(text: "おすすめ順"),
                        ActionItem(text: "新着順"),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "開催地域",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "開催地域", context, actions: [
                        ActionItem(text: Prefecture.hokkaido.toJP(),),
                        ActionItem(text: Prefecture.aomori.toJP(),),
                        ActionItem(text: Prefecture.iwate.toJP(),),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "大学",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () async {
                      EventSort(title: "大学", context, actions: [
                        ActionItem(text: UniversityDictionary.sophia.toJP()),
                        ActionItem(text: UniversityDictionary.tus.toJP()),
                        ActionItem(text: UniversityDictionary.waseda.toJP()),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "キャンパス",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "キャンパス", context, actions: [
                        ActionItem(text: ""),
                        ActionItem(text: ""),
                        ActionItem(text: ""),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "日時",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "日時", context, actions: [
                        ActionItem(text: ""),
                        ActionItem(text: ""),
                        ActionItem(text:"日時を選択"),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "開催方法",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "開催方法", context, actions: [
                        ActionItem(text: "対面・オンライン"),
                        ActionItem(text: "対面"),
                        ActionItem(text: "オンライン"),
                      ]);
                    },
                  ),
                  SearchEventSort(
                    name: "タグ",
                    backgroundColor: Color.fromRGBO(238, 238, 238, 1),
                    onTap: () {
                      EventSort(title: "タグ", context, actions: [
                        ActionItem(text: Prefecture.hokkaido.toJP(),),
                        ActionItem(text: Prefecture.aomori.toJP(),),
                        ActionItem(text: Prefecture.iwate.toJP(),),
                      ]);
                    },
                  ),
                ]),
              ),
            )),
      ),
      SliverList(
          delegate: SliverChildListDelegate(
              List.generate(8, (index) => EventListCard(event: mockEvent11))))
    ]));
  }
}
