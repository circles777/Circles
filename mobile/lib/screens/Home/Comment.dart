import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentSection extends ConsumerWidget {
  final int postIndex;

  const CommentSection({required this.postIndex, Key? key}) : super(key: key);

  static Route<dynamic> route(int postIndex) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CommentSection(postIndex: postIndex),
      // settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'コメント',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 仮のコメント数
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('コメント $index'),
                  subtitle: Text('投稿 $postIndex へのコメントです。'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
