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

      child:Container(
        decoration: BoxDecoration(
    color: Colors.white, // 背景色を白に設定
    borderRadius: BorderRadius.circular(16), // 角の半径を24に設定
  ),   
      child:Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 8, 8, 8), 
                    child: ColumnViewWithGap(
                      gap: 8,
                      children: [
                        Text(event.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        ColumnViewWithGap(gap: 4, children: [
                          RowViewWithGap(gap: 8, children: [
                            Icon(Icons.calendar_today,
                                size: 14, color: Colors.black),
                            Text(start_format)
                          ]),
                          RowViewWithGap(gap: 8, children: [
                            Icon(Icons.person, size: 14, color: Colors.black),
                            Text(
                                '${event.userBookedEvents?.length ?? 0}/${event.capacity} 人')
                          ]),
                          RowViewWithGap(gap: 8, children: [
                            Icon(Icons.map, size: 14, color: Colors.black),
                            Container(
                              width: 170,
                              child: Text(
                                '${event.address.prefecture.toJP()} ${event.address.addition}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // ToDo: 下のタブグリッドの中身は今後仕様を考えていく中でmocksにも実装
                          ]),
                          Container(
                              width: 150,
                              child: Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 123, 140, 153),
                                            width: 1)),
                                    padding: EdgeInsets.only(
                                        left: 8, top: 2, right: 8, bottom: 2),
                                    child: Text('EE',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 123, 140, 153))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 123, 140, 153),
                                            width: 1)),
                                    padding: EdgeInsets.only(
                                        left: 8, top: 2, right: 8, bottom: 2),
                                    child: Text('クラシック',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 123, 140, 153))),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 123, 140, 153),
                                            width: 1)),
                                    padding: EdgeInsets.only(
                                        left: 8, top: 2, right: 8, bottom: 2),
                                    child: Text('音楽',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 123, 140, 153))),
                                  )
                                ],
                              ))
                        ])
                      ],
                    ),
                  ),
                  //ToDo: グッドボタンの数などの仕様
                  Positioned(
                      bottom: 8,
                      right: 8,
                      child: RowViewWithGap(
                        gap: 5,
                        children: [
                          Icon(CupertinoIcons.heart,
                              size: 25,
                              color: Color.fromARGB(255, 255, 159, 159)),
                          Text('7',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 123, 140, 153),
                                  fontSize: 16))
                        ],
                      ))
                ],
              ) ),




    );
  }
}
