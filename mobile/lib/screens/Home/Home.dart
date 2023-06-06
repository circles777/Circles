// ignore_for_file: prefer_const_constructors

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class Home extends HookWidget {
  Home({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Home(),
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
  Widget build(BuildContext context) {
    // TODO: implement build
    final inputUserName = useState<String>('');
    void onChangeUserNameInput(String text) {
      inputUserName.value = text;
    }

    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: Color.fromARGB(255, 106, 130, 251)),
        body: ColumnViewWithGap(
          gap: 8,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text('おすすめサークル',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
            Container(
                height: 70,
                child: ListViewWithGap(
                  gap: 8,
                  horizontal: true,
                  children: nums.map((key) {
                    return Avater(image: AssetImage('public/circle1.jpg'));
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
          ],
        ));
  }
}
