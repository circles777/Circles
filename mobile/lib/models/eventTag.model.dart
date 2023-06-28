// ignore_for_file: empty_constructor_bodies

class EventTag {
  final String id;
  final String name;

  EventTag({
    required this.id,
    required this.name,
  });

  factory EventTag.fromJson(Map<String, dynamic> json) {
    final address = EventTag(
      id: json["_id"],
      name: json['name'],
    );
    return address;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'name': name,
    };
  }
}
