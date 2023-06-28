import 'dart:convert';

import '../../models/user.model.dart';
import '../../utils/url/header.dart';
import '../../utils/url/user.url.dart';
import 'package:http/http.dart' as http;

Future<User?> saveUser(dynamic user) async {
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
    return null;
  }
}
