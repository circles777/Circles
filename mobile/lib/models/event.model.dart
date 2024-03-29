// ignore_for_file: empty_constructor_bodies

import 'package:mobile/models/circle.model.dart';
import 'package:mobile/models/common/address.model.dart';
import 'package:mobile/models/eventTag.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/models/userBookedEvent.model.dart';

class EventModel {
  final String id;
  final String title;
  final User creator;
  final String photoUrl;
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

  EventModel(
      {required this.id,
      required this.title,
      required this.creator,
      required this.photoUrl,
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

  factory EventModel.fromJson(Map<String, dynamic> json) {
    final event = EventModel(
        id: json["_id"],
        title: json['title'],
        creator: User.fromJson(json['user']),
        photoUrl: json['photoUrl'],
        circle: Circle.fromJson(json['circle']),
        recruitEndedAt: json["recruitEndedAt"],
        startedAt: json["startedAt"],
        endedAt: json["endedAt"],
        address: Address.fromJson(json["address"]),
        capacity: json["capacity"],
        participationFee: json["participationFee"],
        detail: json["detail"],
        eventTags: (json['eventTags'] as List<dynamic>).isEmpty == false
            ? json['eventTags'].map((t) => EventTag.fromJson(t)).toList()
            : [],
        userBookedEvents:
            (json['userBookedEvents'] as List<dynamic>).isEmpty == false
                ? json['userBookedEvents']
                    .map((u) => UserBookedEvent.fromJson(u))
                    .toList()
                : []);
    return event;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      'title': title,
      "creator": creator.toJson(),
      "photoUrl": photoUrl,
      "circle": circle?.toJson(),
      "recruitEndedAt": recruitEndedAt,
      "startedAt": startedAt,
      "endedAt": endedAt,
      "address": address.toJson(),
      "capacity": capacity,
      "participationFee": participationFee,
      "detail": detail,
      "eventTags": eventTags?.map((t) => t.toJson()).toList()
    };
  }
}
