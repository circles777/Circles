// ignore_for_file: empty_constructor_bodies

class Tag {
  final String id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    final tag = Tag(
      id: json["_id"],
      name: json['name'],
    );
    return tag;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'name': name,
    };
  }
}
