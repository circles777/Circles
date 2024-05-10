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

import 'package:flutter/material.dart';

class SearchEventSort extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final void Function()? onTap;
  const SearchEventSort(
      {super.key,
      required this.name,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.only(top: 3, right: 5, bottom: 3, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          child: RowViewWithGap(gap: 0, children: [
            Text(name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(61, 154, 239, 1))),
            Icon(
              Icons.expand_more,
              color: const Color.fromRGBO(142, 142, 142, 1),
              size: 24,
            ),
          ])),
    );
  }
}
