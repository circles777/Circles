import 'dart:convert';

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/utils/url/circle.url.dart';

import '../../models/user.model.dart';
import '../../utils/url/header.dart';
import '../../utils/url/user.url.dart';
import 'package:http/http.dart' as http;

Future<List<Circle>?> getCircles() async {
  final url = Uri.parse(getCirclesUrl);
  final jwtJsonHeader = await HeaderForApi().jwtJsonHeader();
  try {
    final response = await http.get(url, headers: jwtJsonHeader);
    final dynamic body = jsonDecode(response.body);
    final List<Circle> res = (body as List<dynamic>).isEmpty == false
        ? body.map((c) => Circle.fromJson(c)).toList()
        : [];
    return res;
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
    return null;
  }
}
