import 'dart:core';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/screens/Auth/CreateNew.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/Auth/Login.dart';

class UserProvider extends StateNotifier<User?> {
  UserProvider() : super(null); // stateにjwtTokenを保存

  void setUser(User user) {
    state = user;
  }

  void removeUser() {
    state = null;
  }

  void updateUser(Map<String, dynamic> data) {
    final user = {...state!.toJson(), ...data};
    state = User.fromJson(user);
  }
}

final userProvider = StateNotifierProvider<UserProvider, User?>((ref) {
  return UserProvider();
});
