import 'dart:convert';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/CreateEvent/CreateEventTag.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CreateEventLocation extends ConsumerWidget {
  CreateEventLocation({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateEventLocation(),
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
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ColumnViewWithGap(
                gap: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: 0.2,
                    valueColor:
                        AlwaysStoppedAnimation(Color.fromRGBO(61, 154, 239, 1)),
                    backgroundColor: Color.fromRGBO(233, 233, 233, 1),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  ColumnViewWithGap(gap: 15, children: [
                    Text(
                      "イベントの開催場所はどこですか",
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
                          hintText: '場所を入力',
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
                    RowViewWithGap(gap: 4, children: [
                      Checkbox(
                          value: isChecked,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          checkColor: Color.fromRGBO(61, 154, 239, 1),
                          //activeColor: Color.fromRGBO(61, 154, 239, 1),
                          side: BorderSide(
                              color: Color.fromRGBO(61, 154, 239, 1)),
                          onChanged: (newValue) {}),
                      Text(
                        "オンラインで開催する",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ])
                  ])
                ],
              ))),
              //ボトムバー
      bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(255, 255, 255, 1),
          surfaceTintColor: Colors.white,
          padding: EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color.fromRGBO(220, 220, 220, 1),width: 1))),
            child: Padding(padding: EdgeInsets.only(left:40, right: 40, top: 10, bottom: 10),
            child:GestureDetector(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>CreateNewEventTag()));
              },
            child:Container(
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
