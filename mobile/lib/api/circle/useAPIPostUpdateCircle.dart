import 'dart:convert';

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/utils/url/circle.url.dart';

import '../../models/user.model.dart';
import '../../utils/url/header.dart';
import '../../utils/url/user.url.dart';
import 'package:http/http.dart' as http;

Future<Circle?> updateCircle(Map<String, dynamic> data) async {
  final url = Uri.parse(updateCircleUrl);
  final jwtJsonHeader = await HeaderForApi().jwtJsonHeader();
  try {
    final response =
        await http.post(url, body: jsonEncode(data), headers: jwtJsonHeader);
    final dynamic body = jsonDecode(response.body);
    final Circle res = Circle.fromJson(body);
    return res;
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
    return null;
  }
}
