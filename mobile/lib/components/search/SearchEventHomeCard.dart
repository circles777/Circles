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
              
      child: Stack(children: [
      Container(
        width: 200,  
        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0)),   
          padding: const EdgeInsets.all(0),
          child: ColumnViewWithGap(
            gap: 5,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0), 
                  ),              
              child:Image.asset(
                event.photoUrl,
                width: 200,
                height: 140,
                fit: BoxFit
                    .cover, // Adjust how the image should be fitted into the container
              )),      
              Container(padding:EdgeInsets.only(left:10.0 , right: 10.0),
              child:ColumnViewWithGap(
            gap: 0,
            children: [        
              Text(event.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xef11, fontFamily: 'MaterialIcons'),
                        size: 15, color: Colors.black),
                    Text(start_format,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500))
                  ],
                ),
               Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(IconData(0xe491, fontFamily: 'MaterialIcons'),
                        size: 15, color: Colors.black),
                    Text(
                        '${event.userBookedEvents?.length ?? 0}/${event.capacity}人',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500))
                  ],
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(IconData(0xf193, fontFamily: 'MaterialIcons'),
                      size: 15, color: Colors.black),
                      SizedBox(
                        width: 150,
                  child:Text(
                      '${event.address.prefecture.toJP()} ${event.address.municipalities} ${event.address.houseNumber}',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          ))
                ],
              ),
                Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(108, 127, 144, 1),
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 123, 140, 153),
                                            width: 1)),
                                    padding: EdgeInsets.only(
                                        left: 5, top: 0, right: 5, bottom: 2),
                                    child: Text('音楽',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(255, 255, 255, 1))),
                                  ),   
              ])                       
          ),
        
          ]),
          ),
          Positioned(
                      bottom: 5,
                      right: 8,
                      child: RowViewWithGap(
                        gap: 5,
                        children: [
                          Icon(CupertinoIcons.heart,
                              size: 27,
                              color: Color.fromARGB(255, 255, 159, 159)),
                          Text('7',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 123, 140, 153),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))
                        ],
                      ))
      ])
    );
  }
}
