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
import 'package:mobile/screens/Forum/ForumList.dart';
import 'package:mobile/screens/Forum/NewForumForm.dart';
import 'package:mobile/screens/Lesson/LessonDetail.dart';
import 'package:mobile/screens/Lesson/LessonList.dart';
import 'package:mobile/screens/Profile/MyProfile.dart';
import 'package:mobile/screens/Search/SearchEventHome.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../utils/url/header.dart';
import '../Circle/CircleDetail.dart';
import '../Circle/CircleList.dart';
import '../Event/JoinedEventList.dart';
import '../User/Mypage.dart';
import 'Home.dart';
import '../Forum/Forum_Categories.dart';

class Index extends ConsumerWidget {
  Index({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Index(),
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
      //CircleList(),
      //EventList(),
      //LessonList(),
      //NewForumForm(),
      /*LessonDetail(
          date: DateTime.now(),
          name: "基礎電子数学及び演習A",
          tags: ["電子電気情報工学科", "機械工学科"]),*/
      Home(),
      //EventDetail(),
      MyProfile(user: ref.read(userProvider.notifier).state ?? mockUser),
      SearchEventHome(),
      JoinedEventList()
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
              icon: Icon(CupertinoIcons.home),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black),
          PersistentBottomNavBarItem(
              icon: Icon(Icons.groups),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black),
          PersistentBottomNavBarItem(
              icon: Icon(CupertinoIcons.square_favorites_alt),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black),
          /*PersistentBottomNavBarItem(
              icon: Icon(CupertinoIcons.mail),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.white),*/
          PersistentBottomNavBarItem(
              icon: Icon(Icons.forum),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black),
          /*PersistentBottomNavBarItem(
              icon: Icon(CupertinoIcons.person),
              activeColorPrimary: Colors.red,
              inactiveColorPrimary: Colors.black),*/
        ]);
  }
}
