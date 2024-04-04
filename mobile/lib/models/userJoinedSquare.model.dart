// ignore_for_file: empty_constructor_bodies

import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/square.modal.dart';
import 'package:mobile/models/user.model.dart';

class UserJoinedSquare {
  final String id;
  final User user;
  final Square square;

  UserJoinedSquare(
      {required this.id, required this.user, required this.square});

  factory UserJoinedSquare.fromJson(Map<String, dynamic> json) {
    final data = UserJoinedSquare(
        id: json["_id"],
        user: User.fromJson(json['user']),
        square: Square.fromJson(json["square"]));
    return data;
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, 'user': user.toJson(), "square": square.toJson()};
  }
}
