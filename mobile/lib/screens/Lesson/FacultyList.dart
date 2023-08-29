// ignore_for_file: prefer_const_constructors

import 'dart:convert';
//import 'dart:ffi';

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
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/Forum/ForumList.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/Lesson/DepartmentListCard.dart';
import '../../components/Lesson/FacultyListCard.dart';


class FacultyList extends HookWidget {
  FacultyList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => FacultyList(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: '掲示板カテゴリ',
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListViewWithGap(
              gap: 16,
              children: const [
                ColumnViewWithGap(gap: 8, children: [
                  //就活
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.userTie,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Faculties.ee,
                  ),
                  //バイト
                  //就活
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.briefcase,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Faculties.s,
                  ),

                  //恋愛
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.heart,
                        size: 40, color: Color.fromRGBO(195, 82, 82, 1)),
                    category: Faculties.os,
                  ),
                  //スポーツ
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.dumbbell,
                        size: 40, color: Color.fromRGBO(0, 0, 0, 1)),
                    category: Faculties.b,
                  ),
                  //ゲーム
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.gamepad,
                        size: 40, color: Color.fromRGBO(154, 44, 227, 1)),
                    category: Faculties.k,
                  ),

                  //食べ物
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.pizzaSlice,
                        size: 40, color: Color.fromRGBO(180, 46, 13, 1)),
                    category: Faculties.ok,
                  ),
                  //エンタメ
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.tv,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Faculties.c,
                  ),
                  //怖い話
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.ghost,
                        size: 40, color: Color.fromARGB(255, 97, 132, 215)),
                    category: Faculties.a,
                  ),
                  //面白い話
                  FacultyListCard(
                    icon: Icon(FontAwesomeIcons.peopleRobbery,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Faculties.e,
                  ),
                ])
              ],
            )));
  }
}
