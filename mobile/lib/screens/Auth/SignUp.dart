import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/components/common/SimpleEventCard.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/university.model.dart';
import 'package:mobile/screens/Auth/CreateNewUser.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class SignUp extends HookWidget {
  SignUp({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => SignUp(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    void pushCreateUser() {
      if (_formKey.currentState?.saveAndValidate() == true) {
        Navigator.of(context).push<dynamic>(
          CreateNewUser.route(
              email: _formKey.currentState?.fields['email']?.value,
              password: _formKey.currentState?.fields['password']?.value),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
            shape:
                Border.all(color: Color.fromRGBO(166, 166, 166, 1), width: 1),
            title: const Text(
              'サインアップ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Color.fromRGBO(0, 167, 220, 1)),
        backgroundColor: Color.fromRGBO(0, 167, 220, 1),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(45),
          child: FormBuilder(
              key: _formKey,
              child: ColumnViewWithGap(gap: 8, children: [
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('メールアドレス',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'email',
                          maxLines: 1,
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
                          decoration: InputDecoration(
                            //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            labelText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 166, 166,
                                      166)), // Set enabled border color here
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 166, 166, 166),
                              ),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Set the border radius here
                            ),
                          ),
                          validator: (FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                            FormBuilderValidators.match(r'^[^ぁ-んァ-ヶ亜-熙]*$',
                                errorText: '日本語を入力しないでください')
                          ])))
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('パスワード',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'password',
                          maxLines: 1,
                          obscureText: true,
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
                          //controller: _textEditingController,
                          decoration: InputDecoration(
                            //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            labelText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 166, 166,
                                      166)), // Set enabled border color here
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 166, 166, 166),
                              ),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Set the border radius here
                            ),
                          ),
                          validator: (FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                            FormBuilderValidators.maxLength(20),
                            FormBuilderValidators.match(r'^[a-zA-Z0-9]*$',
                                errorText: 'アルファベットと数字で入力してください'),
                          ]))),
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('パスワード確認',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'password_confirm',
                          //initialValue: 'y',
                          maxLines: 1,
                          obscureText: true,
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
                          //controller: _textEditingController,
                          decoration: InputDecoration(
                            //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            labelText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 166, 166,
                                      166)), // Set enabled border color here
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 166, 166, 166),
                              ),
                              borderRadius: BorderRadius.circular(
                                  16.0), // Set the border radius here
                            ),
                          ),
                          validator: (FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                            FormBuilderValidators.maxLength(20),
                            FormBuilderValidators.match(r'^[a-zA-Z0-9]*$',
                                errorText: 'アルファベットと数字で入力してください'),
                            (val) {
                              if (_formKey.currentState?.fields['password']
                                      ?.value !=
                                  val) {
                                return 'パスワードが一致しません';
                              }
                            }
                            /*FormBuilderValidators.equal(
                                _formKey
                                    .currentState!.fields['password']!.value,
                                errorText: 'パスワードが一致しません')*/
                          ]))),
                    ])),
                Center(
                    child: GestureDetector(
                  onTap: () => {pushCreateUser()},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(255, 87, 163, 255)),
                    padding:
                        EdgeInsets.only(top: 8, right: 12, bottom: 8, left: 12),
                    child: Text('次へ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ))
              ])),
        )));
  }
}

//a
