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
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/Event/EventDetail.dart';
import 'package:mobile/screens/Event/EventEdit.dart';
import 'package:mobile/screens/Event/EventJoinRequest.dart';
import 'package:mobile/screens/Event/EventNotification.dart';
import 'package:mobile/screens/Event/JoinedEventList.dart';
import 'package:mobile/screens/Event/joinedEventDetail.dart';
import 'package:mobile/screens/Forum/ForumList.dart';
import 'package:mobile/screens/Forum/NewForumForm.dart';
import 'package:mobile/screens/Lesson/LessonDetail.dart';
import 'package:mobile/screens/Lesson/LessonList.dart';
import 'package:mobile/screens/Profile/MyProfile.dart';
import 'package:mobile/screens/Profile/MyTagSelection.dart';
import 'package:mobile/screens/Search/SearchEventHome.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../utils/url/header.dart';
import '../Circle/CircleDetail.dart';
import '../Circle/CircleList.dart';
import '../User/Mypage.dart';
import '../Forum/Forum_Categories.dart';

class EventIndex extends ConsumerWidget {
  EventIndex({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EventIndex(),
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
    //ref.watch(headerProvider.notifier).checkAuth(context, ref); //ログイン状態かを確認
    final pages = [
      joinedEventDetail(event: mockEvent11),
      EventJoinRequest(),
      //EventDetail(),
      SearchEventHome(),
      EventNotification(),
      EventEdit(event: mockEvent11),
      //MyTagSelection()
      //Mypage()
    ];

    Future<dynamic> pushCircleDetail() => Navigator.of(context).push<dynamic>(
          CircleDetail.route(),
        );

    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double deviceWidth = MediaQuery.of(context).size.width;
    return PersistentTabView(context,
        screens: pages,
        navBarHeight: 48,
        backgroundColor: Colors.white,
        navBarStyle: NavBarStyle.simple,
        items: [
          PersistentBottomNavBarItem(
              icon: Icon(Icons.group),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black,
              title: "イベント",
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.comment),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black,
              title: "チャット",
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.mode_edit),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black,
              title: "投稿",
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.notifications),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black,
              title: "通知",
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.settings),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black,
              title: "設定",
              textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w100)),
        ]);
  }
}
