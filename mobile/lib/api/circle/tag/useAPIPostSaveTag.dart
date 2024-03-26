import 'dart:convert';
import 'package:mobile/models/circle.model.dart';
import 'package:mobile/utils/url/circle.url.dart';
import '../../../utils/url/header.dart';
import 'package:http/http.dart' as http;

Future<Circle?> saveTag(Map<String, dynamic> data) async {
  final url = Uri.parse(saveTagUrl);
  final jwtJsonHeader = await HeaderForApi().jwtJsonHeader();
  try {
    final response =
        await http.post(url, body: jsonEncode(data), headers: jwtJsonHeader);
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
