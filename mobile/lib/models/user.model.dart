// ignore_for_file: empty_constructor_bodies
import 'dart:convert';

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
  final String? photoUrl;
  final UserRole role;
  final Gender gender;
  final DateTime birthDate;
  final Address address;
  //final University? university; //テストのために一時的に必須ではなくしてる
  final UniversityDictionary university;
  final String faculty;
  final String department;
  final int grade;
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
      this.photoUrl,
      required this.role,
      required this.gender,
      required this.birthDate,
      required this.address,
      required this.university,
      required this.faculty,
      required this.department,
      required this.grade,
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
        photoUrl: json['photoUrl'],
        role: UserRole.values.byName(json['role']),
        gender: Gender.values.byName(json['gender']),
        birthDate: DateTime.parse(json['birthDate']),
        address: Address.fromJson(json['address']),
        /*university: json['university'] != null
            ? University.fromJson(json['university'])
            : null,*/
        university: UniversityDictionary.values.byName(json["university"]),
        faculty: json['faculty'],
        department: json['department'],
        grade: json['grade'],
        introduction: json['introduction'],
        tags: (json['tags'] as List<dynamic>).isEmpty == false
            ? json['tags'].map((t) => Tag.fromJson(t)).toList()
            : [],
        eventTags: (json['eventTags'] as List<dynamic>).isEmpty == false
            ? json['eventTags'].map((t) => EventTag.fromJson(t)).toList()
            : [],
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
      "photoUrl": photoUrl,
      "role": role.displayName,
      "gender": gender.displayName,
      "birthDate": birthDate,
      "address": address.toJson(),
      "university": university.displayName,
      "faculty": faculty,
      "department": department,
      "grade": grade,
      "introduction": introduction,
      "tags": tags.map((Tag t) => t.toJson()).toList(),
      "eventTags": eventTags.map((e) => e.toJson()).toList(),
      "password": password
    };
  }
}
