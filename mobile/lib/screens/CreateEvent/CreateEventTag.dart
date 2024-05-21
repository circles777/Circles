import 'dart:convert';

import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/Tag2.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/CreateEvent/CreateEventName.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CreateNewEventTag extends HookWidget {
  CreateNewEventTag({super.key});
  ExpandableController sportsController =
      ExpandableController(initialExpanded: false);
  ExpandableController musicController =
      ExpandableController(initialExpanded: false);
  ExpandableController volunteerController =
      ExpandableController(initialExpanded: false);
  ExpandableController gameController =
      ExpandableController(initialExpanded: false);
  ExpandableController studyController =
      ExpandableController(initialExpanded: false);
  ExpandableController actionController =
      ExpandableController(initialExpanded: false);
  ExpandableController otherController =
      ExpandableController(initialExpanded: false);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateNewEventTag(),
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
  Widget build(BuildContext context) {
    final eeTagState = useState<bool>(false);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "イベント作成",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              "終了",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ])),
      body: 
      /*Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ColumnViewWithGap(
                gap: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: 0.4,
                    valueColor:
                        AlwaysStoppedAnimation(Color.fromRGBO(61, 154, 239, 1)),
                    backgroundColor: Color.fromRGBO(233, 233, 233, 1),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  ColumnViewWithGap(gap: 15, children: [
                    Text(
                      "イベントのタグを選択してください",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                        width: 350,
                        height: 42,
                        child: TextField(
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 154, 239, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 154, 239, 1))),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: 'タグを検索',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(175, 175, 175, 1)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: const Color.fromRGBO(175, 175, 175, 1),
                            size: 24,
                          ),
                        ))),
                  ])
                ],
              ))),*/
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16, right: 16),
              child: ListViewWithGap(
        horizontal: false,
        gap: 8,
        children: [
          LinearProgressIndicator(
                    value: 0.4,
                    valueColor:
                        AlwaysStoppedAnimation(Color.fromRGBO(61, 154, 239, 1)),
                    backgroundColor: Color.fromRGBO(233, 233, 233, 1),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(8),
                  ),
          Text(
                      "イベントのタグを選択してください",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                        width: 350,
                        height: 42,
                        child: TextField(
                            decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 154, 239, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 154, 239, 1))),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: 'タグを検索',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(175, 175, 175, 1)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: const Color.fromRGBO(175, 175, 175, 1),
                            size: 24,
                          ),
                        ))),
          const SizedBox(
            height: 12,
          ),
          ExpandableNotifier(
            controller: sportsController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('スポーツ系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('スポーツ系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: '硬式テニス', isActive: false),
                          Tag2(name: 'バレー', isActive: false),
                          Tag2(name: 'バトミントン', isActive: false),
                          Tag2(name: 'バスケ', isActive: false),
                          Tag2(name: 'スキー', isActive: false),
                          Tag2(name: '弓道', isActive: false),
                          Tag2(name: 'ランニング', isActive: false),
                          Tag2(name: 'フットボール', isActive: false),
                          Tag2(name: 'ソフトテニス', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: musicController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('音楽系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('音楽系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: volunteerController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ボランティア系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ボランティア系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: gameController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ゲーム系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ゲーム系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: studyController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('勉強系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('勉強系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: actionController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('活動系',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('活動系',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          ),
          ExpandableNotifier(
            controller: otherController,
            child: ExpandableButton(
                child: Expandable(
              collapsed: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('その他',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 73, 131),
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                      Icon(Icons.expand_more,
                          size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                    ],
                  )),
              expanded: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color.fromARGB(255, 178, 178, 178), width: 1)),
                  child: ColumnViewWithGap(
                    gap: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('その他',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 7, 73, 131),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Icon(Icons.expand_less,
                              size: 24, color: Color.fromARGB(255, 7, 73, 131)),
                        ],
                      ),
                      Wrap(
                        spacing: 4,
                        children: [
                          Tag2(
                            name: 'EE',
                            isActive: eeTagState.value,
                            onTap: () => eeTagState.value = !eeTagState.value,
                          ),
                          Tag2(name: 'クラシック', isActive: false),
                          Tag2(name: '音楽', isActive: false),
                        ],
                      )
                    ],
                  )),
            )),
          )
        ],
      )),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNewEventName()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(52, 170, 255, 1),
                      ),
                      child: Center(
                          child: Text(
                        "次へ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  )))),
    );
  }
}
