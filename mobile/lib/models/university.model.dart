// ignore_for_file: empty_constructor_bodies
import 'package:mobile/models/common/enums.dart';

import 'common/address.model.dart';

class University {
  final String id;
  final UniversityDictionary university;
  final String campus;
  final Address address;
  University({
    required this.id,
    required this.university,
    required this.campus,
    required this.address,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    final res = University(
      id: json["_id"],
      university: UniversityDictionary.values.byName(json["university"]),
      campus: json['campus'],
      address: Address.fromJson(json['address']),
    );
    return res;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "university": university.displayName,
      'campus': campus,
      'address': address.toJson(),
    };
  }
}
