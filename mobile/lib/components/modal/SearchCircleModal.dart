import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/RowWithGap.dart';

class SearchCircleModal extends StatelessWidget {
  final double gap;
  final List<Widget> children;
  final bool? horizontal;
  const SearchCircleModal({
    super.key,
    required this.gap,
    required this.children,
    this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //title: const Text('タイトル'),
      contentPadding: EdgeInsets.all(16),
      children: <Widget>[
        ColumnViewWithGap(gap: 16, children: <Widget>[
          RowViewWithGap(gap: 8, children: <Widget>[
            Text(
              '場所:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ])
        ])
      ],
    );
  }
}
