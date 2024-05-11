import 'dart:convert';
//import 'dart:ffi';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/Tag2.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/event/EventListCard.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class MyTagSelection extends HookWidget {
  MyTagSelection({super.key});
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
      builder: (_) => MyTagSelection(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eeTagState = useState<bool>(false);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return BaseLayout(
        title: 'マイタグ',
        appBar: AppBar(
            toolbarHeight: 46,
            title: Text(
              'マイタグ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 12, 44, 73)),
            ),
            leading: Icon(Icons.arrow_back_ios,
                size: 24, color: Color.fromARGB(255, 12, 44, 73)),
            actions: [
              GestureDetector(
                  onTap: () => {},
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      '保存',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 17, 121, 206)),
                    ),
                  )))
            ],
            backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        child: ListViewWithGap(
          horizontal: false,
          gap: 8,
          children: [
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                            color: Color.fromARGB(255, 178, 178, 178),
                            width: 1)),
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
                                size: 24,
                                color: Color.fromARGB(255, 7, 73, 131)),
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
        ));
  }
}
