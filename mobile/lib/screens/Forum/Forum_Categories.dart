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
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ForumCategories extends HookWidget {
  ForumCategories({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ForumCategories(),
      //settings: RouteSettings(arguments: someId),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseLayout
    (title: '掲示板カテゴリ',
     child: Padding(
      padding:EdgeInsets.all(16.0),
      child:ListViewWithGap(
        gap: 16,
        children: [
          ColumnViewWithGap(gap: 8, children: [
            //就活
               Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.userTie, 
                size:40, 
                color: Color.fromRGBO(
                  103, 102, 102, 1
                )),
              Text('就活',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //バイト
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.briefcase, 
                size:40, 
                color: Color.fromRGBO(
                  103, 102, 102, 1
                )),
              Text('バイト',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //恋愛
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.heart,
                size:40, 
                color: Color.fromRGBO(195, 82, 82, 1)),
              Text('恋愛',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //スポーツ
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.dumbbell, 
                size:40, 
                color: Color.fromRGBO(0, 0, 0, 1)),
              Text('スポーツ',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //ゲーム
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.gamepad, 
                size:40, 
                color: Color.fromRGBO(154, 44, 227, 1)),
              Text('ゲーム',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //食べ物
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.pizzaSlice, 
                size:40, 
                color: Color.fromRGBO(180, 46, 13, 1)),
              Text('食べ物',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Color.fromARGB(255, 0, 0, 0)))
            ])   
            ),),
            //エンタメ
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.tv, 
                size:40, 
                color: Color.fromRGBO(
                  103, 102, 102, 1
                )),
              Text('エンタメ',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            //怖い話
   Container(
          decoration: BoxDecoration(
            border: Border(
      bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.ghost, 
                size:40, 
                color: Color.fromARGB(255, 97, 132, 215)),
              Text('怖い話',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Color.fromARGB(255, 0, 0, 0)))
            ])   
            ),),
            //面白い話
   Container(
        decoration: BoxDecoration(
        border: Border(
        bottom: BorderSide(
        color: Colors.black,  // 下線の色を指定
        width: 1.0,  ))
          ),
          padding: EdgeInsets.only(bottom: 10), 
          child:GestureDetector(
            onTap: () {

            },
            child: RowViewWithGap(gap: 32, children: [
              Icon(
                FontAwesomeIcons.peopleRobbery, 
                size:40, 
                color: Color.fromRGBO(
                  103, 102, 102, 1
                )),
              Text('面白い話',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w600 ,
                color: Colors.black))
            ])   
            ),),
            
          ]
          )
        ],)
      
      ));
  }
}
