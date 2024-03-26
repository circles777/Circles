// ignore_for_file: empty_constructor_bodies
import 'package:mobile/models/common/enums.dart';

class Address {
  final Prefecture prefecture;
  final String municipalities;
  final String houseNumber;
  final String? addition;

  Address(
      {required this.prefecture,
      required this.municipalities,
      required this.houseNumber,
      this.addition});

  factory Address.fromJson(Map<String, dynamic> json) {
    final address = Address(
        prefecture:
            Prefecture.values.byName(json['prefecture']), //json["prefecture"],
        municipalities: json['municipalities'],
        houseNumber: json['houseNumber'],
        addition: json['addtion']);
    return address;
  }

  Map<String, dynamic> toJson() {
    return {
      "prefecture": prefecture.displayName,
      'municipalities': municipalities,
      'houseNumber': houseNumber,
      'addition': addition
    };
  }
}
