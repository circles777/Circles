import 'package:flutter/material.dart';
import 'package:mobile/screens/Profile/MyProfileEditor.dart';
import 'package:mobile/screens/Profile/AdressAddtionEditor.dart';
import 'dart:convert';
import 'dart:developer';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/EventCard.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/search/SearchEventListCard.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:mobile/utils/url/header.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/Profile/MyProfileEditor.dart';

import '../../components/common/SquareCard.dart';
import '../../components/search/SearchEventHomeCard.dart';


class AdressEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.center,        
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0), // 左側に10の空白を追加
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left_sharp, color: Color(0xFF0C2D49), size: 36.0),
              onPressed: () {
                Navigator.pop(context); // アイコンを押すと前の画面に戻る
              },
            ),
          ),
        ),
        title: Text(
          '所在地',
          style: TextStyle(
            color: Color(0xFF0C2D49), // タイトルの色を設定
            fontSize: 18.0, // タイトルのサイズを設定
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true, // タイトルを中央に配置     
        backgroundColor: Colors.white, // 背景色を白に設定
      ),
      backgroundColor: Colors.white, // body の背景色を白に設定

      
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Container(
              child: Text(
                '都道府県',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF0C2D49),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left, 
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: Prefecture.values.length,
                itemBuilder: (context, index) {
                  final prefecture = Prefecture.values[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdressAdditionEditor(prefecture: prefecture),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity, // 横幅を画面いっぱいにする
                            alignment: Alignment.centerLeft, // テキストを左揃えにする
                            child: Text(
                              prefecture.toJP(),
                              style: TextStyle(fontSize: 16.0, color: Color(0xFF396E9C), fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left, // テキストを左揃えにする
                            ),
                          ),
                          SizedBox(height: 10.0),  //ここは10
                          Container(
                            height: 1.0,
                            color: Color(0xFFE9E9E9), // タイトルの色を設定
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
