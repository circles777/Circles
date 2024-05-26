import 'package:flutter/material.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/screens/Profile/MyProfileEditor.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:flutter/cupertino.dart';

class AdressAdditionEditor extends StatelessWidget {
  final Prefecture prefecture;
  final String? previousAddition; //previousaddtionは多分要らない

  AdressAdditionEditor({required this.prefecture, this.previousAddition});

  final TextEditingController _additionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 前の詳細住所があれば、それを表示
    _additionController.text = previousAddition ?? mockUser.address?.addition ?? '';  //previousaddtionは多分要らない

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_sharp, color: Color(0xFF0C2D49), size: 36.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '所在地',
          style: TextStyle(
            color: Color(0xFF0C2D49),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '都道府県',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Color(0xFF0C2D49),),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    prefecture.toJP(),
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF396E9C), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 1.2,
                    color: Color(0xFFE9E9E9),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '詳細（任意）',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Color(0xFF0C2D49)),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _additionController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE9E9E9),
                          width: 1.2,
                        ),
                      ),
                      labelText: '詳細住所',
                      labelStyle: TextStyle(fontSize: 16.0, color: Color(0xFFE9E9E9)),
                      contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 0), // 上下左右それぞれ4の間隔を空ける
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 入力された情報を適用して新しい住所を作成
                  final newAddress = Address(
                    prefecture: prefecture,
                    addition: _additionController.text.isNotEmpty ? _additionController.text : previousAddition ?? mockUser.address?.addition,  //previousaddtionは多分要らない
                  );
                  // 新しい住所情報を使ってユーザー情報を更新
                  final newUser = mockUser.copyWith(address: newAddress);
                  // 更新されたユーザー情報を使ってMyProfileEditorに遷移
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyProfileEditor(user: newUser),
                    ),
                  );
                },
                child: Text('決定'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
