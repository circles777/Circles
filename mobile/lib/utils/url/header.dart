import 'dart:core';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/screens/Auth/CreateNew.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/Auth/Login.dart';

class HeaderForApi extends StateNotifier<String> {
  HeaderForApi() : super(''); // stateにjwtTokenを保存
  static Map<String, String> jsonHeader = {"Content-Type": "application/json"};
  late Map<String, String> jwtJsonHeader = {
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

  checkAuth(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (state == '' || state == null) {
      Navigator.of(context).push<dynamic>(
        Login.route(),
      );
    }
  }
}

final headerProvider = StateNotifierProvider<HeaderForApi, String>((ref) {
  return HeaderForApi();
});
