import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/utils/url/auth.url.dart';
import 'package:mobile/utils/url/header.dart';
import 'package:mobile/utils/url/index.dart';
import 'package:mobile/utils/url/user.url.dart';
import 'package:http/http.dart' as http;

import '../../models/common/enums.dart';
import '../../models/user.model.dart';
import '../../providers/user.provider.dart';

class UserClient {
  static Future<User?> saveUser(dynamic user) async {
    final url = Uri.parse(saveUserUrl);
    try {
      final response = await http.post(url,
          body: jsonEncode(user), headers: HeaderForApi.jsonHeader);
      final dynamic body = jsonDecode(response.body);
      final User res = User.fromJson(body);
      return res;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  static Future<User?> login(
      String email, String password, WidgetRef ref) async {
    final url = Uri.parse(baseUrl + AuthUrls.loginUrl);
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password
          }), // jsonHeaderでjson形式を指定しているため、json形式にする必要あり
          headers: HeaderForApi.jsonHeader);
      final dynamic body = jsonDecode(response.body);
      ref.read(headerProvider.notifier).setToken(body['access_token']);
      //print(body['tags'].runtimeType);
      final User user = User.fromJson(body);
      ref.read(userProvider.notifier).setUser(user);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
}
