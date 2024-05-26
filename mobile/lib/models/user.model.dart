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
  late Address address;  //addressは後から変更可能にする // addressをlate修飾子を使用して遅延初期化
  //final University? university; //テストのために一時的に必須ではなくしてる
  final UniversityDictionary university;
  final String faculty;
  final String department;
  final int grade;
  final String? introduction;
  final List<Tag> tags;
  final List<EventTag> eventTags;
  final String? password;
  final String sanka;
  final String kikaku;

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
      this.password,
      required this.sanka,
      required this.kikaku});

  // copyWithメソッドを追加
  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? firstNameKana,
    String? lastNameKana,
    String? username,
    String? email,
    String? photoUrl,
    UserRole? role,
    Gender? gender,
    DateTime? birthDate,
    Address? address, // addressの変更を可能にする
    UniversityDictionary? university,
    String? faculty,
    String? department,
    int? grade,
    String? introduction,
    List<Tag>? tags,
    List<EventTag>? eventTags,
    String? password,
    String? sanka,
    String? kikaku}){
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      firstNameKana: firstNameKana ?? this.firstNameKana,
      lastNameKana: lastNameKana ?? this.lastNameKana,
      username: username ?? this.username,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address, // addressの変更を可能にする
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      department: department ?? this.department,
      grade: grade ?? this.grade,
      introduction: introduction ?? this.introduction,
      tags: tags ?? this.tags,
      eventTags: eventTags ?? this.eventTags,
      password: password ?? this.password,
      sanka: sanka ?? this.sanka,
      kikaku: kikaku ?? this.kikaku
    );
  }








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
        password: json['password'],
        sanka: json['kikaku'],
        kikaku: json['kikaku']);
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
      "password": password,
      "sanka": kikaku,
      "kikaku": kikaku
    };
  }
}
