import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';

class CommentSection extends ConsumerWidget {
  final int postIndex;

  const CommentSection({required this.postIndex, Key? key}) : super(key: key);

  static Route<dynamic> route(int postIndex) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CommentSection(postIndex: postIndex),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _commentController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // 背景色を設定
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'コメント',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // 仮のコメント数
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        leading: const CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('public/Vball.jpg'),
                        ),
                        title: const Text(
                          'UserName 4日前',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '投稿 $postIndex へのコメントです。',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                '返信する',
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(CupertinoIcons.heart),
                              onPressed: () {
                                // いいねボタンの処理
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            const Text(
                              '10', // ここにいいねの数を設定
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0), // 左側の余白を追加
                        child: ExpandableNotifier(
                          child: Column(
                            children: [
                              Expandable(
                                collapsed: Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    ExpandableButton(
                                      child: const Text(
                                        '返信を見る',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                expanded: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                      leading: const CircleAvatar(
                                        radius: 14,
                                        backgroundImage:
                                            AssetImage('public/Vball.jpg'),
                                      ),
                                      title: const Text(
                                        'UserName 3日前',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '投稿 $postIndex への別のコメントです。',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          const SizedBox(height: 4),
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Text(
                                              '返信する',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                CupertinoIcons.heart),
                                            onPressed: () {
                                              // いいねボタンの処理
                                            },
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                          ),
                                          const Text(
                                            '5', // ここにいいねの数を設定
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ExpandableButton(
                                      child: const Text(
                                        '閉じる',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    hintText: 'コメントを入力してください...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // コメント投稿の処理
                  print(_commentController.text);
                  _commentController.clear();
                },
                child: const Text('投稿'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
