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
import 'package:mobile/screens/Profile/AdressAddtionEditor.dart';
import 'package:mobile/screens/Profile/AdressEditor.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:mobile/utils/url/header.dart';
import 'package:mobile/screens/Profile/MyProfile.dart';
import 'package:mobile/screens/Profile/AdressEditor.dart';
import 'package:mobile/screens/Profile/IntroductionEditor.dart';
import 'package:mobile/screens/Profile/MyProfileEditor.dart';

import '../../components/common/SquareCard.dart';
import '../../components/search/SearchEventHomeCard.dart';

import 'package:flutter/material.dart';

// IntroductionEditorクラスの定義
class IntroductionEditor extends StatefulWidget {
  @override
  _IntroductionEditorState createState() => _IntroductionEditorState();
}

class _IntroductionEditorState extends State<IntroductionEditor> {
  final TextEditingController _controller = TextEditingController(text: 'どうぞよろしくお願いいたします！好きなスポーツはバレーです！');
  int _charCount = 0;

  void _updateCharCount() {
    setState(() {
      _charCount = _controller.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateCharCount);
    _charCount = _controller.text.length; // 初期値の長さを設定
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCharCount);
    _controller.dispose();
    super.dispose();
  }

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
          'ひとこと',
          style: TextStyle(
            color: Color(0xFF0C2D49), // タイトルの色を設定
            fontSize: 18.0, // タイトルのサイズを設定
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true, // タイトルを中央に配置     
        backgroundColor: Colors.white, // 背景色を白に設定
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      style: TextStyle(fontSize: 16), // 文字サイズを16に設定
                      decoration: InputDecoration(
                        border: InputBorder.none, // 囲いを消す
                        labelText: '', // プレースホルダーを消す
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Spacer(),
                        Text('$_charCount/100'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfileEditor(user: mockUser)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(220, 40), // 横220、縦40
                  backgroundColor: Color(0xFF34AAFF), // 色は34AAFF
                ),
                child: Text(
                    '決定',
                    style: TextStyle(
                      fontSize: 16, // 文字サイズ16
                      color: Colors.white, // 文字色を白に設定
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// メイン関数
void main() {
  runApp(MaterialApp(
    home: IntroductionEditor(),
  ));
}
