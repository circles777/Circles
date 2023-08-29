// ignore_for_file: empty_constructor_bodies

import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/user.model.dart';

class UserBookedEvent {
  final String id;
  final User user;
  final Event event;

  UserBookedEvent({required this.id, required this.user, required this.event});

  factory UserBookedEvent.fromJson(Map<String, dynamic> json) {
    final book = UserBookedEvent(
        id: json["_id"],
        user: User.fromJson(json['user']),
        event: Event.fromJson(json["event"]));
    return book;
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, 'user': user.toJson(), "event": event.toJson()};
  }
}
