// ignore_for_file: empty_constructor_bodies
import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/tag.model.dart';
import 'package:mobile/models/university.model.dart';
import 'package:mobile/models/user.model.dart';

import 'common/address.model.dart';

class Circle {
  final String id;
  final User creator;
  final String name;
  final String introduction;
  final String detail;
  final University university;
  final Address address;
  final DateTime foundedDate;
  final String contactNumber;
  final int numberOfMembers;
  final List<Tag>? tags;
  final bool? confirmed;
  final bool isAvailable;
  Circle(
      {required this.id,
      required this.creator,
      required this.name,
      required this.introduction,
      required this.detail,
      required this.university,
      required this.address,
      required this.foundedDate,
      required this.contactNumber,
      required this.numberOfMembers,
      this.tags,
      this.confirmed,
      required this.isAvailable});

  factory Circle.fromJson(Map<String, dynamic> json) {
    final circle = Circle(
      id: json["_id"],
      creator: User.fromJson(json["creator"]),
      name: json['name'],
      introduction: json["introduction"],
      detail: json['detail'],
      university: University.fromJson(json['university']),
      address: Address.fromJson(json['address']),
      foundedDate: json["foundedDate"],
      contactNumber: json["contactNumber"],
      numberOfMembers: json["numberOfMembers"],
      tags: (json['tags'] as List<dynamic>).isEmpty == false
          ? json['tags'].map((t) => Tag.fromJson(t)).toList()
          : [],
      confirmed: json["confirmed"],
      isAvailable: json["isAvailable"],
    );
    return circle;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "creator": creator.toJson(),
      "name": name,
      "introduction": introduction,
      "detail": detail,
      "university": university.toJson(),
      'address': address.toJson(),
      "foundedDate": foundedDate,
      "contactNumber": contactNumber,
      "numberOfMembers": numberOfMembers,
      "tags": tags?.map((t) => t.toJson()).toList(),
      "confirmed": confirmed,
      "isAvailable": isAvailable
    };
  }
}
