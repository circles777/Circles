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
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/screens/Forum/ForumList.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/forum/ForumCategoryCard.dart';

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
    return BaseLayout(
        title: '掲示板カテゴリ',
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListViewWithGap(
              gap: 16,
              children: const [
                ColumnViewWithGap(gap: 8, children: [
                  //就活
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.userTie,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: ForumCategory.part,
                  ),
                  //バイト
                  //就活
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.briefcase,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: ForumCategory.part,
                  ),

                  //恋愛
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.heart,
                        size: 40, color: Color.fromRGBO(195, 82, 82, 1)),
                    category: ForumCategory.love,
                  ),
                  //スポーツ
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.dumbbell,
                        size: 40, color: Color.fromRGBO(0, 0, 0, 1)),
                    category: ForumCategory.sport,
                  ),
                  //ゲーム
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.gamepad,
                        size: 40, color: Color.fromRGBO(154, 44, 227, 1)),
                    category: ForumCategory.game,
                  ),

                  //食べ物
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.pizzaSlice,
                        size: 40, color: Color.fromRGBO(180, 46, 13, 1)),
                    category: ForumCategory.food,
                  ),
                  //エンタメ
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.tv,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: ForumCategory.entertainment,
                  ),
                  //怖い話
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.ghost,
                        size: 40, color: Color.fromARGB(255, 97, 132, 215)),
                    category: ForumCategory.scaryStory,
                  ),
                  //面白い話
                  ForumCategoryCard(
                    icon: Icon(FontAwesomeIcons.peopleRobbery,
                        size: 40, color: Color.fromRGBO(103, 102, 102, 1)),
                    category: ForumCategory.funnyStory,
                  ),
                ])
              ],
            )));
  }
}
