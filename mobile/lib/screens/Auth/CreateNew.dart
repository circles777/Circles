// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/components/common/TextFormWithOutLine.dart';
import 'package:mobile/screens/Auth/Login.dart';
import 'package:mobile/utils/helpers/alert.dart';
import 'package:mobile/utils/helpers/successDialog.dart';

class CreateNew extends HookWidget {
  CreateNew({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CreateNew(),
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
    // TODO: implement build
    final inputUserName = useState<String>('');
    final inputUserFirstName = useState<String>('');
    final inputUserLastName = useState<String>('');
    final inputEmail = useState<String>('');
    final inputPassword = useState<String>('');
    final inputRePassword = useState<String>('');
    void onChangeUserNameInput(String text) {
      inputUserName.value = text;
    }

    void onChangeUserFirstName(String text) {
      inputUserFirstName.value = text;
    }

    void onChangeUserLastName(String text) {
      inputUserLastName.value = text;
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
            title: const Text('Create New'),
            backgroundColor: const Color.fromRGBO(251, 140, 106, 1)),
        body: Center(
          child: Form(
              key: _formKey,
              child: SizedBox(
                width: deviceWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create New',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your username',
                      onChanged: onChangeUserNameInput,
                      validationText: 'your username',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your first name',
                      onChanged: onChangeUserFirstName,
                      validationText: 'your first name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your last name',
                      onChanged: onChangeUserLastName,
                      validationText: 'your last name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your email',
                      onChanged: onChangeEmailInput,
                      validationText: 'your email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your password',
                      onChanged: onChangePasswordInput,
                      validationText: 'your password',
                      validator: passwordValidator,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormWithOutLine(
                      hintText: 'Enter your password again',
                      onChanged: onChangeRePasswordInput,
                      validationText: 'your repassword',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (inputPassword.value != inputRePassword.value) {
                            Alert(
                                    title: 'Something wrong',
                                    content:
                                        'Please confirm whether your password matches repassword',
                                    context: context)
                                .showAlert();
                            return;
                          }
                          await UserClient.saveUser({
                            'username': inputUserName.value,
                            'firstName': inputUserFirstName.value,
                            'lastName': inputUserLastName.value,
                            'email': inputEmail.value,
                            'password': inputPassword.value
                          }).then(
                              (value) => {
                                    SuccessDialog(
                                            title:
                                                'Welcome ${value!.firstName} ${value.lastName}',
                                            content:
                                                'You succeeded to register your account!',
                                            context: context)
                                        .showAlert(),
                                    Navigator.of(context).push(
                                      Login.route(),
                                    )
                                  },
                              onError: (err) => Alert(
                                      title: 'Something wrong',
                                      content: err,
                                      context: context)
                                  .showAlert());
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text('Register')),
                  ],
                ),
              )),
        ));
  }
}
