// ignore_for_file: empty_constructor_bodies
import 'package:mobile/models/common/enums.dart';

class Address {
  final Prefecture prefecture;
  final String municipalities;
  final String? houseNumber;

  Address({
    required this.prefecture,
    required this.municipalities,
    this.houseNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    final address = Address(
      prefecture:
          Prefecture.values.byName(json['prefecture']), //json["prefecture"],
      municipalities: json['municipalities'],
      houseNumber: json['houseNumber'],
    );
    return address;
  }

  Map<String, dynamic> toJson() {
    return {
      "prefecture": prefecture.displayName,
      'municipalities': municipalities,
      'houseNumber': houseNumber,
    };
  }
}
