import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/models/square.modal.dart';

import '../../models/event.model.dart';
import '../../screens/Search/SearchEventDetail.dart';

class SquareCard extends StatelessWidget {
  final Square square;
  final void Function()? onTap;
  const SquareCard({super.key, required this.square, this.onTap});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(
                  255, 166, 166, 166), //Color.fromRGBO(96, 125, 139, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Image.asset(
                  square.photoUrl,
                  fit: BoxFit
                      .cover, // Adjust how the image should be fitted into the container
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
                child: ColumnViewWithGap(
                  gap: 8,
                  children: [
                    Text(square.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800)),
                    Text(square.detail,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                        )),
                    RowViewWithGap(
                      gap: 8,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                            IconData(0xe491, fontFamily: 'MaterialIcons'),
                            size: 14,
                            color: Colors.black),
                        Text('${square.userJoinedSquares?.length ?? 0}人',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
