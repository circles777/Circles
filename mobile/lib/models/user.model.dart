// ignore_for_file: empty_constructor_bodies
import 'dart:convert';
import 'dart:js_util';

import 'package:mobile/models/common/enums.dart';
import 'package:mobile/models/tag.model.dart';
import 'package:mobile/models/university.model.dart';

import 'common/address.model.dart';
import 'eventTag.model.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String firstNameKana;
  final String lastNameKana;
  final String username;
  final String email;
  final UserRole role;
  final Gender gender;
  final DateTime birthDate;
  final Address address;
  final University university;
  final String? introduction;
  final List<Tag> tags;
  final List<EventTag> eventTags;
  final String? password;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.firstNameKana,
      required this.lastNameKana,
      required this.username,
      required this.email,
      required this.role,
      required this.gender,
      required this.birthDate,
      required this.address,
      required this.university,
      required this.introduction,
      required this.tags,
      required this.eventTags,
      this.password});

  // Getterを利用してクラスのプライベート変数を参照できるようにする
  /*int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get fullname => _fullname;
  String get username => _username;
  String get email => _email;*/

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json['lastName'],
        firstNameKana: json['firstNameKana'],
        lastNameKana: json['lastNameKana'],
        username: json['username'],
        email: json["email"],
        role: UserRole.values.byName(json['role']),
        gender: Gender.values.byName(json['gender']),
        birthDate: json['birthDate'],
        address: Address.fromJson(json['address']),
        university: University.fromJson(json['university']),
        introduction: json['introduction'],
        tags: jsonDecode(json['tags']).map((t) => t.fromJson()).toList(),
        eventTags:
            jsonDecode(json['eventTags']).map((t) => t.fromJson()).toList(),
        password: json['password']);
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "firstName": firstName,
      'lastName': lastName,
      'firstNameKana': firstNameKana,
      'lastNameKana': lastNameKana,
      'username': username,
      "email": email,
      "role": role.displayName,
      "gender": gender.displayName,
      "birthDate": birthDate,
      "address": address.toJson(),
      "university": university.toJson(),
      "introduction": introduction,
      "tags": tags.map((Tag t) => t.toJson()).toList(),
      "eventTags": eventTags.map((e) => e.toJson()).toList(),
      "password": password
    };
  }
}
