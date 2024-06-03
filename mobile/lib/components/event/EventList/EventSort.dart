import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';

/// ボトムシートの原型
///
/// ここでがグローバルで宣言しているが[ActionBottomSheet]のstatic methodで宣言してもいい
Future<void> EventSort(
  BuildContext context, {
  required List<ActionItem> actions,
  required String title, 
}) async {
  // Flutter標準のボトムシートの関数を呼び出す
  // 細かな設定はここで行う
  // 引数のbuilderに[ActionBottomSheet]を返す
  await showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    elevation: 0,
    builder: (context) {
      // 引数のactionsはここではなくて呼び出し元で設定するので、
      // [showActionBottomSheet]の引数にする
      return ActionBottomSheet(actions: actions, title: title,);
    },
  );
}

/// ボトムシートの土台
class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet({
    required this.actions,
    required this.title,
    super.key,
  });

  /// アクションは別に受け取るようにする
  final List<ActionItem> actions;
final String title;
  /// staticで宣言したボトムシートの原型
  ///
  /// 今回は[show]メソッドはわず、[showActionBottomSheet]使っている。
  /// どちらでも良い。
  static Future<void> show(
    BuildContext context, {
    required List<ActionItem> actions,
    required String title,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return ActionBottomSheet(actions: actions, title: title,);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
      color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ColumnViewWithGap(gap: 0, children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          ColumnViewWithGap(gap:0, children: actions)
        ]))]);
  }
}

/// [ActionBottomSheet]にのせる選択肢
class ActionItem extends StatelessWidget {
  const ActionItem({
    required this.text,
    this.onTap,
    super.key,
  });

  final String text;

  /// タップ処理を後で書きたい時のためにあえてnull許容にする
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        onTap: () {
          Navigator.pop(context);
          onTap?.call();
        },
      ),
    );
  }
}
