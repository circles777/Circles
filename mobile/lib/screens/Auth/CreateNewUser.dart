import 'dart:convert';
import 'dart:math';
//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:mobile/api/user/useAPIPostCreateUser.dart';
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
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class CreateNewUser extends HookWidget {
  final String email;
  final String password;
  CreateNewUser({super.key, required this.email, required this.password});

  static Route<dynamic> route(
      {required String email, required String password}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateNewUser(
        email: email,
        password: password,
      ),
      //settings: RouteSettings(arguments: someId),
    );
  }

  final _formKey = GlobalKey<FormBuilderState>();
  String? passwordValidator(String text) {
    if (text.length < 8) {
      return 'Please enter the password with at least 8 letters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    //final university = useState<University>()
    /*void onChangeUserFirstName(String text) {
      inputUserFirstName.value = text;
    }*/
    void checkValidateAndSubmit() async {
      if (_formKey.currentState?.saveAndValidate() == true) {
        //print(_formKey.currentState?.value);
        createUser({
          'user': {
            ..._formKey.currentState!.value,
            'email': email,
            'password': password,
            'address': {
              'prefecture': _formKey.currentState!.fields['prefecture']!.value,
              'municipalities':
                  _formKey.currentState!.fields['municipalities']!.value,
              'houseNumber':
                  _formKey.currentState!.fields['houseNumber']!.value,
              'addition': _formKey.currentState!.fields['addition']!.value,
            },
          },
          'university': {
            '_id': '652619b4d6028846125ab5a3',
            'university': '東京理科大学',
            'campus': '野田キャンパス',
            'address': {
              'prefecture': 'chiba',
              'municipalities': '野田市山崎',
              'houseNumber': '2641'
            }
          }
        }).then((user) {
          if (user?.id != null) {
            Navigator.of(context).push<dynamic>(Login.route());
          }
        });
      }
    }

    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            shape:
                Border.all(color: Color.fromRGBO(166, 166, 166, 1), width: 1),
            title: const Text(
              '新規作成',
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
                      const Text('ユーザーネーム',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'username',
                          maxLines: 1,
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
                            FormBuilderValidators.maxLength(12),
                            FormBuilderValidators.match(r'^[a-zA-Z0-9]*$',
                                errorText: 'アルファベットと数字で入力してください'),
                          ]))),
                    ])),

                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('姓',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'lastName',
                          maxLines: 1,
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
                            FormBuilderValidators.match(
                                r'^[^"#$%&()*+-.,\/:;<=>?@[\]^_`{|}~。、？!]*$',
                                errorText: '特殊記号やスペースは入力しないでください'),
                          ]))),
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('名',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'firstName',
                          maxLines: 1,
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
                            FormBuilderValidators.match(
                                r'^[^"#$%&()*+-.,\/:;<=>?@[\]^_`{|}~。、？!]*$',
                                errorText: '特殊記号やスペースは入力しないでください'),
                          ]))),
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('セイ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'lastNameKana',
                          maxLines: 1,
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
                            FormBuilderValidators.match(r'^[ァ-ヶ]*$',
                                errorText: 'カタカナで入力してください'),
                          ]))),
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('メイ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderTextField(
                          name: 'firstNameKana',
                          maxLines: 1,
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
                            FormBuilderValidators.match(r'^[ァ-ヶ]*$',
                                errorText: 'カタカナで入力してください'),
                          ]))),
                    ])),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('住所',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      SizedBox(
                        width: deviceWidth * 0.4,
                        child: FormBuilderDropdown(
                          name: 'prefecture',
                          decoration: InputDecoration(
                            //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            hintText: '都道府県',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(122, 166, 166, 166),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.2),

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

                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
                          items: Prefecture.values.map((p) {
                            return DropdownMenuItem(
                              child: Text(p.toJP()),
                              value: p.displayName,
                            );
                          }).toList(),
                          validator: (FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ])),
                          //value: gender.value
                        ),
                      ),
                    ])),
                SizedBox(
                  width: deviceWidth * 0.8,
                  child: FormBuilderTextField(
                      name: 'municipalities',
                      maxLines: 1,
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
                        hintText: '市区町村',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(122, 166, 166, 166),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.2),
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
                      ]))),
                ),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: FormBuilderTextField(
                        name: 'houseNumber',
                        maxLines: 1,
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
                          hintText: '家屋番号 (例:12-3-4)',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(122, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
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
                          FormBuilderValidators.match(r'^[0-9-]*$',
                              errorText: '数字と半角バーで入力してください'),
                        ])))),
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: FormBuilderTextField(
                        name: 'addition',
                        maxLines: 1,
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
                          hintText: '追加情報',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(122, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
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
                        validator: (FormBuilderValidators.compose([])))),
                SizedBox(
                  width: deviceWidth * 0.4,
                  child: ColumnViewWithGap(gap: 2, children: [
                    const Text('生年月日',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))),
                    /*RowViewWithGap(gap: 8, children: [
                        FormBuilderDropdown(
                          //4
                          name: 'birthYear',

                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            labelText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                //vertical: 0,
                                horizontal: 8),
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

                          isDense: true,
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 166, 166),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.2),
                          items: List.generate(DateTime.now().year - 1900 + 1,
                              (index) => 1900 + index).map((int i) {
                            return DropdownMenuItem(
                              value: i,
                              child: Text(i.toString() + '年'),
                            );
                          }).toList(),
                          onChanged: (int? year) {
                            birthDate.value = DateTime(
                                year ?? birthDate.value.year,
                                birthDate.value.month,
                                birthDate.value!.day);
                          },
                          //value: birthDate.value.year
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // Set the background color here
                            borderRadius: BorderRadius.circular(
                                16), // Optional: Add border radius
                          ),
                          child: FormBuilderDropdown(
                            name: 'birthMonth',

                            items: List.generate(12, (index) => 1 + index)
                                .map((int i) {
                              return DropdownMenuItem(
                                value: i,
                                child: Text(i.toString() + '月'),
                              );
                            }).toList(),
                            onChanged: (int? month) {
                              birthDate.value = DateTime(
                                  birthDate.value.year,
                                  month ?? birthDate.value.month,
                                  birthDate.value.day);
                            },
                            //value: birthDate.value.month
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // Set the background color here
                            borderRadius: BorderRadius.circular(
                                16), // Optional: Add border radius
                          ),
                          child: FormBuilderDropdown(
                            name: 'birthDay',

                            items: List.generate(31, (index) => 1 + index)
                                .map((int i) {
                              return DropdownMenuItem(
                                value: i,
                                child: Text(i.toString() + '日'),
                              );
                            }).toList(),
                            onChanged: (int? day) {
                              birthDate.value = DateTime(
                                  birthDate.value.year,
                                  birthDate.value.month,
                                  day ?? birthDate.value.day);
                            },
                            //value: birthDate.value.day
                          ),
                        )
                      ])*/
                    FormBuilderDateTimePicker(
                        name: 'birthDate',
                        inputType: InputType.date,
                        initialDatePickerMode: DatePickerMode.year,
                        format: DateFormat('yyyy/MM/dd'),
                        decoration: InputDecoration(
                          //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 166, 166, 166),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.2),
                        validator: (FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                        valueTransformer: (value) {
                          return DateFormat("yyyy-MM-ddTHH:mm:ss")
                              .format(value!);
                        })
                  ]),
                ),
                SizedBox(
                    width: deviceWidth * 0.5,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('性別',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderDropdown(
                        name: 'gender',
                        decoration: InputDecoration(
                          //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
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

                        style: TextStyle(
                            color: Color.fromARGB(255, 166, 166, 166),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.2),
                        items: Gender.values.map((v) {
                          return DropdownMenuItem(
                              child: Text(v.toJP()), value: v.displayName);
                        }).toList(),
                        validator: (FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                        //value: gender.value
                      ),
                    ])),

                //一旦大学記入しなくてもOK(テスト的に)
                SizedBox(
                    width: deviceWidth * 0.8,
                    child: ColumnViewWithGap(gap: 2, children: [
                      const Text('大学',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                      FormBuilderDropdown(
                        name: 'university',
                        decoration: InputDecoration(
                          //isDense, isCollapsedをtrueにしないとcontentPaddingのverticalは反映されない
                          isDense: true,
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
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

                        style: TextStyle(
                            color: Color.fromARGB(255, 166, 166, 166),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.2),
                        items: [
                          //5
                          DropdownMenuItem(child: Text('東京理科大学'), value: ''),
                        ],
                        //onChanged: () {},
                        /*validator: (FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),*/
                        //value: gender.value
                      ),
                    ])),
                Center(
                    child: GestureDetector(
                  onTap: () => {checkValidateAndSubmit()},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color.fromARGB(255, 87, 163, 255)),
                    padding:
                        EdgeInsets.only(top: 8, right: 12, bottom: 8, left: 12),
                    child: Text('登録',
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
