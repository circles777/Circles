import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/FlexRow.dart';
import 'package:mobile/components/common/RowWithGap.dart';

import '../../models/event.model.dart';
import '../../screens/Search/SearchEventDetail.dart';

class SearchEventListCard extends StatelessWidget {
  final EventModel event;
  final void Function()? onTap;
  const SearchEventListCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    String start_format =
        DateFormat('yyyy/MM/dd hh:mm〜').format(event.startedAt);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: onTap ??
            () => Navigator.of(context).push<dynamic>(
                  SearchEventDetail.route(event: event),
                ),
        child: Container(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                  color: Color.fromARGB(
                      255, 166, 166, 166), //Color.fromRGBO(96, 125, 139, 1),
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: Color.fromARGB(
                      255, 166, 166, 166), //Color.fromRGBO(96, 125, 139, 1),
                  width: 1.0,
                )),
            //borderRadius: BorderRadius.circular(16),
          ),
          child: RowViewWithGap(
            gap: 12,
            children: [
              Image.asset(
                event.photoUrl,
                width: 150,
                height: 100,
                fit: BoxFit
                    .cover, // Adjust how the image should be fitted into the container
              ),
              Container(
                width: deviceWidth - 150 - 16 - 8 - 8,
                child: ColumnViewWithGap(gap: 4, children: [
                  Text(event.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                          size: 12, color: Colors.black),
                      Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Text(event.detail,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                                IconData(0xe491, fontFamily: 'MaterialIcons'),
                                size: 12,
                                color: Colors.black),
                            Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                                IconData(0xef11, fontFamily: 'MaterialIcons'),
                                size: 12,
                                color: Colors.black),
                            Text(start_format,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500))
                          ],
                        ),
                        const Icon(CupertinoIcons.bookmark,
                            size: 12, color: Colors.black)
                      ]),
                ]),
              ),
            ],
          ),
        ));
  }
}
