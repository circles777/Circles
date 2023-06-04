import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/utils/helpers/alert.dart';

import '../../components/common/TextFormWithOutLine.dart';
import '../../utils/helpers/successDialog.dart';
import '../../utils/url/header.dart';

class Login extends HookConsumerWidget {
  //HookConsumerWidgetはHooksとProvider両方を提供するためのもの。
  const Login({Key? key}) : super(key: key);
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const Login(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputEmail = useState<String>('');
    final inputPassword = useState<String>('');
    onChangeEmailInput(String text) {
      inputEmail.value = text;
    }

    onChangePasswordInput(String text) {
      inputPassword.value = text;
    }

    Future loginUser() async {
      //print(inputEmail.value + ' ' + inputPassword.value);
      if (inputEmail.value == '' || inputPassword.value == '') {
        Alert(
                title: 'Something wrong',
                content: 'Please fill email and password.',
                context: context)
            .showAlert();
        return;
      }
      await UserClient.login(inputEmail.value, inputPassword.value, ref).then(
          (value) => {
                SuccessDialog(
                        title: 'Welcome ${value!.firstName} ${value.lastName}',
                        content: 'You succeeded to register your account!',
                        context: context)
                    .showAlert(),
              },
          onError: (err) =>
              Alert(title: 'Something wrong', content: err, context: context)
                  .showAlert());
    }

    double deviceWidth = MediaQuery.of(context).size.width;

    //ref.watch(headerProvider.notifier).checkAuth(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: const Color.fromRGBO(251, 140, 106, 1)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: deviceWidth * 0.8,
                child: Column(children: <Widget>[
                  const Text('JAEL',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormWithOutLine(
                      hintText: 'Enter your email',
                      onChanged: onChangeEmailInput),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormWithOutLine(
                    hintText: 'Password',
                    onChanged: onChangePasswordInput,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                      onPressed: () => {loginUser()},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Next',
                          style: TextStyle(color: Colors.white)))
                ])),
          ],
        ),
      ),
    );
  }
}
