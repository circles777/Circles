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
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class CreateNewUser extends HookWidget {
  CreateNewUser({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateNewUser(),
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
     final inputUserName = useState<String>('');
    final inputUserFirstName = useState<String>('');
    final inputUserLastName = useState<String>('');
    final inputEmail = useState<String>('');
    final inputPassword = useState<String>('');
    final inputRePassword = useState<String>('');
    void onChangeUserFirstName(String text) {
      inputUserFirstName.value = text;
    }
    void onChangeUserFirstNameFurigana(String text) {
      inputUserLastName.value = text;
    }
    void onChangeUserLastName(String text) {
      inputUserLastName.value = text;
    }
    void onChangeUserLastNameFurigana(String text) {
      inputUserLastName.value = text;
    }
     void onChangeUserAdress(String text) {
      inputUserName.value = text;
    }
     void onChangeUserBirthYear(String text) {
      inputUserName.value = text;
    }
    void onChangeUserBirthMonth(String text) {
      inputUserName.value = text;
    }
    void onChangeUserBirthDate(String text) {
      inputUserName.value = text;
    }
     void onChangeUserSex(String text) {
      inputUserName.value = text;
    }
     void onChangeUserUniversity(String text) {
      inputUserName.value = text;
    }
    void onChangeEmailInput(String text) {
      inputEmail.value = text;
    }
    void onChangePasswordInput(String text) {
      inputPassword.value = text;
    }
    void onChangeRePasswordInput(String text) {
      inputRePassword.value = text;
    }
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(color :Color.fromRGBO(166, 166, 166, 1), width: 1),
        title:const Text('新規作成'),
        backgroundColor:  Color.fromRGBO(0, 167, 220, 1)),
        backgroundColor:  Color.fromRGBO(0, 167, 220, 1),
        body:Padding(
          padding: EdgeInsets.all(45),
           child:Form(
              key: _formKey,
              child: ColumnViewWithGap(gap: 8, children:[
              SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('姓',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                    SizedBox(
                      height: 39,
                    child:TextFormWithOutLine(
                      hintText: '佐藤',
                      onChanged: onChangeUserLastName,
                      validationText: 'your lastname',
                    ),
                    )
                  ])),
              SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('名',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                    child:TextFormWithOutLine(
                      hintText: '隆',
                      onChanged: onChangeUserFirstName,
                      validationText: 'your firstname',
                    ),    
                            )           
                  ])),
                  SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('セイ',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                    child:TextFormWithOutLine(
                      hintText: 'サトウ',
                      onChanged: onChangeUserLastNameFurigana,
                      validationText: 'your lastname',
                    ),       
                            )        
                  ])),
                    SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('メイ',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                    child:TextFormWithOutLine(
                      hintText: 'タカシ',
                      onChanged: onChangeUserFirstNameFurigana,
                      validationText: 'your firstname',
                    ),      
                            )         
                  ])),
                    SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('住所',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                    child:TextFormWithOutLine(
                      hintText: '東京都　江戸川区　7-3-58',
                      onChanged: onChangeUserAdress,
                      validationText: 'your adress',
                    ),          
                            )     
                  ])),
                   SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('生年月日',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                          child:RowViewWithGap(
                            gap: 8, 
                            children: [
                              SizedBox(
                                width: 75,
                              child:TextFormWithOutLine(
                      hintText: '2001年',
                      onChanged: onChangeUserBirthYear,
                      validationText: 'your BirthYear',
                    ),),
                    SizedBox(
                      width: 58,
                    child:TextFormWithOutLine(
                      hintText: '06月',
                      onChanged: onChangeUserBirthMonth,
                      validationText: 'your BirthMonth',
                    ),),
                    SizedBox(
                      width: 58,
                    child:TextFormWithOutLine(
                      hintText: '23日',
                      onChanged: onChangeUserBirthDate,
                      validationText: 'your BirthDate',
                    ),)
                    ])      )         
                  ])),
                  SizedBox(
                width: deviceWidth * 0.15,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('性別',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height: 39,
                    child:TextFormWithOutLine(
                      hintText: '男性',
                      onChanged: onChangeUserSex,
                      validationText: 'your sex',
                    ),               
                            )
                  ])),
                  SizedBox(
                width: deviceWidth * 0.8,
                child: ColumnViewWithGap(
                  gap: 2,
                  children: [
                    const Text('大学',
                        style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))
                            ),
                            SizedBox(
                              height:39,
                    child:TextFormWithOutLine(
                      hintText: '東京理科大学',
                      onChanged: onChangeUserUniversity,
                      validationText: 'your University',
                    ), 
                            )              
                  ])),
              ])
              
        ),

        )
    );
    
  }}
//a