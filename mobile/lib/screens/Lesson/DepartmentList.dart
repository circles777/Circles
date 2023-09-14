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
import 'package:mobile/components/Lesson/DepartmentListCard.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/Lesson/DepartmentList.dart';
import 'package:mobile/screens/Forum/ForumList.dart';
import 'package:mobile/screens/Lesson/FacultyList.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../components/Lesson/DepartmentListCard.dart';

class DepartmentList extends HookWidget {
  DepartmentList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => DepartmentList(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    final double deviceHeight = MediaQuery.of(context).size.height;
    return BaseLayout(

        title: '学部',
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListViewWithGap(
              gap: 16,
              children: const [
                ColumnViewWithGap(gap: 8, children: [
                  //理学部第一部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.userTie,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Departments.science1,
                  ),
                  //工学部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.briefcase,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: Departments.engineering,
                  ),

                  //薬学部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.heart,
                        size: 40, color: Color.fromRGBO(195, 82, 82, 1)),
                    category: Departments.phscience,
                  ),
                  //創域理工学部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.dumbbell,
                        size: 40, color: Color.fromRGBO(0, 0, 0, 1)),
                    category: Departments.scienceandtech,
                  ),
                  //先進工学部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.gamepad,
                        size: 40, color: Color.fromRGBO(154, 44, 227, 1)),
                    category: Departments.adengineering,
                  ),

                  //経営学部
                  DepartmentListCard(
                    icon: Icon(FontAwesomeIcons.pizzaSlice,
                        size: 40, color: Color.fromRGBO(180, 46, 13, 1)),
                    category: Departments.management,
                  ),
                ])
              ],
            )));
  }
}
