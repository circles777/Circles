// ignore_for_file: empty_constructor_bodies

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/models/userBookedEvent.model.dart';

class Event {
  final String id;
  final String title;
  final User creator;
  final Circle? circle;
  final DateTime recruitEndedAt;
  final DateTime startedAt;
  final DateTime endedAt;
  final Address address;
  final int capacity;
  final int participationFee;
  final String detail;
  final List<EventTag>? eventTags;
  final List<UserBookedEvent>? userBookedEvents;

  Event(
      {required this.id,
      required this.title,
      required this.creator,
      this.circle,
      required this.recruitEndedAt,
      required this.startedAt,
      required this.endedAt,
      required this.address,
      required this.capacity,
      required this.participationFee,
      required this.detail,
      this.eventTags,
      this.userBookedEvents});

  factory Event.fromJson(Map<String, dynamic> json) {
    final event = Event(
        id: json["_id"],
        title: json['title'],
        creator: User.fromJson(json['user']),
        circle: Circle.fromJson(json['circle']),
        recruitEndedAt: json["recruitEndedAt"],
        startedAt: json["startedAt"],
        endedAt: json["endedAt"],
        address: Address.fromJson(json["address"]),
        capacity: json["capacity"],
        participationFee: json["participationFee"],
        detail: json["detail"],
        eventTags: 
        );
    return event;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'title': title,
    };
  }
}
