import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

import '../../models/common/enums.dart';
import 'package:mobile/screens/Lesson/FacultyList.dart';
import 'package:mobile/screens/Lesson/DepartmentList.dart';



class DepartmentListCard extends StatelessWidget {
  final Departments category;
  final Icon icon;
  const DepartmentListCard(
      {super.key, required this.icon, required this.category});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    void pushFacuityList(DepartmentList cat) =>
        Navigator.of(context).push<dynamic>(
          FacultyList.route(),
        );
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black, // 下線の色を指定
        width: 1.0,
      ))),
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
          onTap: () => {},
          child: RowViewWithGap(gap: 32, children: [
            /*Icon(FontAwesomeIcons.userTie,
                size: 40, color: Color.fromRGBO(103, 102, 102, 1)),*/
            icon,
            Text(category.displayName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black))
          ])),
    );
  }
}
