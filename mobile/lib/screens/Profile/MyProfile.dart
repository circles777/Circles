// ignore_for_file: prefer_const_constructors

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

class MyProfile extends ConsumerWidget {
  final User user;

  MyProfile({super.key, required this.user});

  static Route<dynamic> route({required User user}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MyProfile(
        user: user,
      ),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(user.toJson());
    const List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    final double deviceWidth = MediaQuery.of(context).size.width;
    return BaseLayout(
        title: '',
        appBar: AppBar(toolbarHeight: 0),
        child: ListViewWithGap(horizontal: false, gap: 20, 
        children: [
          Stack(
            children: [
              AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(user.photoUrl ?? 'public/momo.jpeg',
                      fit: BoxFit.cover)),

               // グラデーションを持つ黒いコンテナ
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8), // ここで暗さを調整
                      ],
                    ),
                  ),
                ),
              ),                   
          
              Positioned(
                  top: 8,
                  right: 16,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child:
                            Icon(Icons.settings, size: 24, color: Colors.white),
                      ),
                    ),
                  )),


              Positioned(
                  top: 8,
                  right: 58,
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyProfileEditor(user: mockUser)),
                    )
                    },
                    child: Opacity(
                      opacity: 0.4,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.border_color,
                            size: 24, color: Colors.white),
                      ),
                    ),
                  )),


              Positioned(
                  bottom: 16, //Stackの第一子要素から相対的に
                  left: 20,
                  child: GestureDetector(
                    onTap: () => {},
                    child: Text(
                      '${user.lastName} ${user.firstName}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                  )),
            ],
          ),



          //多分ここからがプロフィール
          Container(
            margin: EdgeInsets.only(top:0, bottom:0, left: 8, right: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ColumnViewWithGap(
              gap: 8,
              children: [
                Text('プロフィール',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'YourFontFamily')), //フォントの種類をこれで変更できるがあまり変わっていない
 
                Container(
                          margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
                          child: ColumnViewWithGap(
                            gap: 2,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('大学',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF074A83),
                                ),
                              ),
                              ColumnViewWithGap(
                                gap: 0,
                                children: [ 
                                  Text(user.university.toJP(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 0.85,
                                    ),
                                  ),
                                  Text('${user.faculty}-${user.department}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),],),),
              

                Container(
  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
  child: ColumnViewWithGap(
    gap: 2,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('性別',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF074A83),
        ),
      ),
      Text('${user.gender.toJP()}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),
Container(
  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
  child: ColumnViewWithGap(
    gap: 2,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('学年',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF074A83),
        ),
      ),
      Text('${user.grade}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),
Container(
  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
  child: ColumnViewWithGap(
    gap: 2,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('所在地',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF074A83),
        ),
      ),
      Text('${user.address.prefecture.toJP()} ${user.address.municipalities} ${user.address.houseNumber}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),
Container(
  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
  child: ColumnViewWithGap(
    gap: 2,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[
      Text('イベント',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF074A83),
        ),
      ),
      RowViewWithGap(
        gap: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowViewWithGap(
            gap: 4,
            children: [
              Text('${user.sanka}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
              Text('参加',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          RowViewWithGap(
            gap: 4,
            children: [
              Text('${user.kikaku}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
              Text('企画',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
),

Container(
  margin: EdgeInsets.only(left: 8), // 左に10の空白を追加
  child: ColumnViewWithGap(
    gap: 2,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('ひとこと',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF074A83),
        ),
      ),
      Text('${user.introduction}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
),



                
                  ],
            ),
          ),
              
               
                



/*
                RowViewWithGap(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.person_outline,
                        size: 19, color: Colors.black),
                    Text('${user.grade}年',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                  gap: 4,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                        size: 19, color: Colors.black),
                    Text('${user.address.prefecture.toJP()}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                RowViewWithGap(
                    gap: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_border,
                          size: 19, color: Colors.black),
                      Text('4参加', // ToDo: 今までの参加イベントの数を表示
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('1企画', // ToDo: 今までの参加イベントの数を表示
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ]),
              ],
            ),
          ),
             //ここまでがプロフィール
*/

 ColumnViewWithGap(gap: 4, children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('マイタグ',
                      style:
                          TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0C2D49),),) // テキストの色を指定)),
                ],
              ),
            ),

Container(
            margin: EdgeInsets.only(top:0, left: 8, right: 8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SizedBox(
              width: double.infinity, // 親コンテナの幅をいっぱいに広げる
             child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'テニス', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'バレー', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'よく話す', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        '活発', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        '一人暮らし', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),
             
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'テニス', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'バレー', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        'よく話す', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        '活発', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(color: Color.fromRGBO(123, 140, 153, 1),),),// 枠線を青色に設定),
                      child: const Text(
                        '一人暮らし', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(123, 140, 153, 1),
                      ),
                    ),),

                  ]),
        ),),],),
           
        






          ColumnViewWithGap(gap: 4, children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('参加したイベント',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF0C2D49),)),
                  GestureDetector(
                    onTap: () => {},
                    child: Text('すべて表示',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3D9AEF),)),
                  ),
                ],
              ),
            ),


            //ここからが参加したイベント画面、アイコン的なやつ
            Container(
              height: 210,
              child: ListViewWithGap(
                  gap: 0,
                  horizontal: true,
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: EventCard(event: mockEvent11),
                          ))),
            )
          ]),
          //ここで、参加したイベントの表示自体が終了

            ColumnViewWithGap(gap: 4, children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('企画したイベント',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xFF0C2D49),)),
                  GestureDetector(
                    onTap: () => {},
                    child: Text('すべて表示',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3D9AEF),)),
                  ),
                ],
              ),
            ),


            //ここからが企画したイベント画面、アイコン的なやつ
            Container(
              height: 210,
              margin: EdgeInsets.only(bottom: 16),
              child: ListViewWithGap(
                  gap: 0,
                  horizontal: true,
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: EventCard(event: mockEvent11),
                          ))),
            )
          ]),
          //ここで、企画したイベントの表示自体が終了


  
        ]));
  }
}
