// ignore_for_file: empty_constructor_bodies
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String? fullname;
  final String username;
  final String email;
  /*final int _id;
  final String _firstName;
  final String _lastName;
  final String _fullname;
  final String _username;
  final String _email;*/
  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.fullname,
      required this.username,
      required this.email});

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
      fullname: json['fullname'],
      username: json['username'],
      email: json["email"],
    );
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "firstName": firstName,
      'lastName': lastName,
      'fullname': fullname,
      'username': username,
      "email": email,
    };
  }
}
