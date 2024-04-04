import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/utils/url/auth.url.dart';

import '../../models/user.model.dart';
import '../../providers/user.provider.dart';
import '../../utils/url/header.dart';
import '../../utils/url/user.url.dart';
import 'package:http/http.dart' as http;

Future<User?> authenticate(WidgetRef ref) async {
  final url = Uri.parse(authenticateUrl);
  try {
    final headers = await HeaderForApi().jwtJsonHeader();
    final response = await http.post(url, headers: headers);
    //print(response);
    final dynamic body = jsonDecode(response.body);
    //print(body);
    final User user = User.fromJson(body);
    ref.read(userProvider.notifier).setUser(user);
    return user;
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
    return null;
  }
}
