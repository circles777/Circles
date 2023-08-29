// ignore_for_file: prefer_const_constructors

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';

class NewForumForm extends HookWidget {
  const NewForumForm({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => NewForumForm(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final inputTitle = useState<String>('');
    final inputContent = useState<String>('');

    final double deviceHeight = MediaQuery.of(context).size.height;
    return BaseLayout(
      title: '新規掲示板作成',
      child: Padding(
          padding: EdgeInsets.only(top: 24, right: 24, left: 24),
          child: ColumnViewWithGap(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 8,
            children: [
              ColumnViewWithGap(
                  mainAxisAlignment: MainAxisAlignment.start,
                  gap: 2,
                  children: <Widget>[
                    Text(
                      'タイトル',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    TextField(
                      onChanged: (value) => inputTitle.value = value,
                      style: TextStyle(
                          height: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 122, 122, 122)),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 227, 227, 227),
                        filled: true,
                        hintText: 'タイトルを入力してください',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 122, 122, 122)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 216, 216, 216),
                              width: 1),
                          borderRadius: BorderRadius.circular(
                              16.0), // Set the radius here
                        ),
                      ),
                    )
                  ]),
              ColumnViewWithGap(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  gap: 2,
                  children: [
                    Text(
                      '内容',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    TextField(
                      onChanged: (value) => inputContent.value = value,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 122, 122, 122)),
                      minLines: 8,
                      maxLines: 8,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 227, 227, 227),
                        hintText: '内容を入力してください',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 122, 122, 122)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 216, 216, 216),
                              width: 1),
                          borderRadius: BorderRadius.circular(
                              16.0), // Set the radius here
                        ),
                      ),
                    ),
                  ]),
              Center(
                  child: GestureDetector(
                onTap: () => {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color.fromARGB(255, 87, 163, 255)),
                  padding:
                      EdgeInsets.only(top: 8, right: 12, bottom: 8, left: 12),
                  child: Text('作成',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ))
            ],
          )),
    );
  }
}
