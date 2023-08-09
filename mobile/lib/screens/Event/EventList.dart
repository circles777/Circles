import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/EventCard.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/Tag.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/components/forum/ForumCard.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventList extends HookWidget {
  EventList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EventList(),
      //settings: RouteSettings(arguments: someId),
    );
  }

@override
 Widget build(BuildContext context) {

  return BaseLayout(
      title: 'イベント一覧',
      child: Padding(padding: EdgeInsets.only(top: 8, right: 8, left: 8),
      child:ColumnViewWithGap(gap: 8, 
      children: [
        RowViewWithGap(gap: 2, children: [
          SizedBox(
            width: 280,
            height: 32,
            child:TextField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), 
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass, size: 20,),
                hintText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
          ))),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('検索',
              style: TextStyle(fontSize:16, fontWeight: FontWeight.w600 )
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(9, 167, 220, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
            ),
        ]),
        RowViewWithGap(gap: 2, children: [
          Text('条件:', 
          style: TextStyle(fontSize:14, fontWeight: FontWeight.w600),
          ),
            Tag(
              name: '東京都', 
              backgroundColor: Color.fromRGBO(17, 189, 2, 0.65)
              ),
            Tag(
              name: '東京理科大学', 
              backgroundColor: Color.fromRGBO(206, 0, 210, 0.63)
              ),
            Tag(
              name: '3000円', 
              backgroundColor: Color.fromRGBO(104, 51, 255, 0.65)
              ),
              Tag(
              name: '学生のみ', 
              backgroundColor: Color.fromRGBO(255, 44, 56, 0.65)
              ),
        ]),
         Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
              color: Color.fromRGBO(
                  166, 166, 166, 1), //Color.fromRGBO(96, 125, 139, 1),
              width: 1.0,
            )))),
            Text('イベント一覧',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            ListViewWithGap(gap: 16, children: [ 
      EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        EventCard(
        image: AssetImage('public/circle1.jpg'), 
        circleName: 'キャンパーサークル', 
        title: '飲み会', 
        venue: '東京都', 
        date: DateTime(2023,06,05), 
        cost: '3000円'),
        
            ]),
      ])
      )
 );
 }



}