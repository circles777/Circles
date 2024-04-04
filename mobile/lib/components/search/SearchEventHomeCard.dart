import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

import '../../models/event.model.dart';
import '../../screens/Search/SearchEventDetail.dart';

class SearchEventHomeCard extends StatelessWidget {
  final EventModel event;
  final void Function()? onTap;
  const SearchEventHomeCard({super.key, required this.event, this.onTap});

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
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(
                  255, 166, 166, 166), //Color.fromRGBO(96, 125, 139, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          child: ColumnViewWithGap(
            gap: 4,
            children: [
              Image.asset(
                event.photoUrl,
                width: 200,
                height: 140,
                fit: BoxFit
                    .cover, // Adjust how the image should be fitted into the container
              ),
              Text(event.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              RowViewWithGap(gap: 4, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xef11, fontFamily: 'MaterialIcons'),
                        size: 12, color: Colors.black),
                    Text(start_format,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xe491, fontFamily: 'MaterialIcons'),
                        size: 12, color: Colors.black),
                    Text(
                        '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500))
                  ],
                )
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                      size: 12, color: Colors.black),
                  Text(
                      '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500))
                ],
              )
            ],
          )),
    );
  }
}
