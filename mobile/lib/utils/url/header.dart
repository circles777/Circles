import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/api/auth/useAPIPostAuthenticate.dart';
import 'package:mobile/screens/Auth/CreateNew.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/Auth/Login.dart';

class HeaderForApi extends StateNotifier<String> {
  HeaderForApi() : super(''); // stateにjwtTokenを保存
  static Map<String, String> jsonHeader = {"Content-Type": "application/json"};
  late Map<String, String> _jwtJsonHeader = {
    "Content-Type": "application/json",
    "Authorization": 'Bearer $state',
  };

  Future setToken(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await removeToken();
    await localStorage.setString('userToken', token);
    state = localStorage.getString('userToken') ?? '';
  }

  Future removeToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove('userToken');
    state = '';
  }

  Future jwtJsonHeader() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final token = localStorage.getString('userToken') ?? '';
    return {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token',
    };
  }

  checkAuth(BuildContext context, WidgetRef ref) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    state = localStorage.getString('userToken') ?? '';
    //print('local: ${localStorage}');
    if (state == '' || state == null) {
      Navigator.of(context)
          .pushAndRemoveUntil<dynamic>(Login.route(), ((route) => false));
    } else {
      () async {
        await authenticate(ref).catchError((e) {
          Navigator.of(context)
              .pushAndRemoveUntil<dynamic>(Login.route(), ((route) => false));
        });
      };
    }
  }
}

final headerProvider = StateNotifierProvider<HeaderForApi, String>((ref) {
  return HeaderForApi();
});
