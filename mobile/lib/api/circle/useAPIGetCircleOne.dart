import 'dart:convert';

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/utils/url/circle.url.dart';

import '../../models/user.model.dart';
import '../../utils/url/header.dart';
import '../../utils/url/user.url.dart';
import 'package:http/http.dart' as http;

Future<Circle?> getCircleOne(String id) async {
  final url = Uri.parse(getCircleOneUrl + '/$id');
  final jwtJsonHeader = await HeaderForApi().jwtJsonHeader();
  try {
    final response = await http.get(url, headers: jwtJsonHeader);
    print(response);
    final dynamic body = jsonDecode(response.body);
    print(body);
    final Circle res = Circle.fromJson(body);
    return res;
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
    return null;
  }
}
