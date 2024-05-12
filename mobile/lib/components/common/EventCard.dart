import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

import '../../models/event.model.dart';
import '../../screens/Search/SearchEventDetail.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final void Function()? onTap;
  const EventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    String start_format = DateFormat('MM/dd hh:mm〜').format(event.startedAt);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap ??
          () => Navigator.of(context).push<dynamic>(
                SearchEventDetail.route(event: event),
              ),
      child: Container(
          width: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: ColumnViewWithGap(
            gap: 8,
            children: [
              Text(event.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800)),
              Text(event.detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              RowViewWithGap(
                gap: 4,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconData(0xef11, fontFamily: 'MaterialIcons'),
                      size: 16, color: Colors.black),
                  Text(start_format,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              RowViewWithGap(
                gap: 4,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconData(0xe491, fontFamily: 'MaterialIcons'),
                      size: 16, color: Colors.black),
                  Text(
                      '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowViewWithGap(gap: 8, children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromARGB(255, 108, 127, 144)),
                      child: const Text(
                        '2年', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Color.fromARGB(255, 108, 127, 144)),
                      child: const Text(
                        '電電', //ToDo: タグor広場と差し替え
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ]),
                  RowViewWithGap(gap: 4, children: [
                    GestureDetector(
                      onTap: () => {},
                      child: const Icon(Icons.favorite_border,
                          size: 28, color: Color.fromARGB(255, 255, 159, 159)),
                    ),
                    const Text(
                      '7', //ToDo: お気に入りの数を実装
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 142, 142, 142)),
                    )
                  ])
                ],
              )
            ],
          )),
    );
  }
}
