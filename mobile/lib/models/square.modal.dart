// ignore_for_file: empty_constructor_bodies

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/models/userBookedEvent.model.dart';
import 'package:mobile/models/userJoinedSquare.model.dart';

class Square {
  final String id;
  final String name;
  //final User creator;
  final String photoUrl;
  final String detail;
  final List<UserJoinedSquare>? userJoinedSquares;

  Square(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.detail,
      this.userJoinedSquares});

  factory Square.fromJson(Map<String, dynamic> json) {
    final square = Square(
        id: json["_id"],
        name: json['name'],
        photoUrl: json['photoUrl'],
        detail: json["detail"],
        userJoinedSquares:
            (json['userJoinedSquares'] as List<dynamic>).isEmpty == false
                ? json['userJoinedSquares']
                    .map((u) => UserJoinedSquare.fromJson(u))
                    .toList()
                : []);
    return square;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'name': name,
      "photoUrl": photoUrl,
      "detail": detail,
      "userJoinedSquares": userJoinedSquares?.map((t) => t.toJson()).toList()
    };
  }
}
