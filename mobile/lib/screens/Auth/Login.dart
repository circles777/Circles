import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/api/user/user.clent.dart';
import 'package:mobile/screens/Home/index.dart';
import 'package:mobile/utils/helpers/alert.dart';

import '../../components/common/ColumnWithGap.dart';
import '../../utils/helpers/successDialog.dart';

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
    final _formKey = GlobalKey<FormBuilderState>();

    Future loginUser() async {
      //print(inputEmail.value + ' ' + inputPassword.value);
      if (_formKey.currentState?.saveAndValidate() == true) {
        final fields = _formKey.currentState?.fields;
        await UserClient.login(
                fields!['email']?.value, fields['password']?.value, ref)
            .then(
                (value) => {
                      print(value),
                      SuccessDialog(
                              title:
                                  'ようこそ ${value!.lastName} ${value.firstName}',
                              content: 'ログインに成功しました',
                              context: context)
                          .showAlert(),
                      Navigator.of(context).push<dynamic>(
                        Index.route(),
                      )
                    },
                onError: (err) =>
                    Alert(title: 'エラー', content: 'エラーが起きました', context: context)
                        .showAlert());
      }
    }

    double deviceWidth = MediaQuery.of(context).size.width;

    //ref.watch(headerProvider.notifier).checkAuth(context);

    return Scaffold(
        appBar: AppBar(
            shape:
                Border.all(color: Color.fromRGBO(166, 166, 166, 1), width: 1),
            title: const Text(
              'ログイン',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Color.fromRGBO(0, 167, 220, 1)),
        backgroundColor: Color.fromRGBO(0, 167, 220, 1),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(45),
          child: Center(
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
                    Center(
                      child: ElevatedButton(
                        onPressed: () => {loginUser()},
                        style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.only(
                                    top: 12, right: 8, bottom: 12, left: 8)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text('ログイン',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                    )
                  ]))),
        )));
  }
}
