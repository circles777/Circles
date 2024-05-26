import 'dart:convert';
import 'dart:html';
// データのエンコードとデコードに必要
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
// FlutterのUIデザイン集
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/screens/Event/EventDetail.dart';
import 'package:mobile/screens/Event/JoinedEventList.dart';
import 'package:mobile/screens/Home/Comment.dart';
import 'package:mobile/screens/Home/JoiningEventChat.dart';
import 'package:mobile/screens/Home/post.dart';

class Home1 extends ConsumerStatefulWidget {
  Home1({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Home1(),
      // settings: RouteSettings(arguments: someId),
    );
  }

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends ConsumerState<Home1> {
  final List<int> _hiddenPosts = [];
  final List<bool> _likedPosts = List.filled(20, false);
  final List<int> _likeCounts = List.filled(20, 0);
  OverlayEntry? _overlayEntry;

  _toggleLike(int index) {
    setState(() {
      if (_likedPosts[index]) {
        _likeCounts[index]--;
      } else {
        _likeCounts[index]++;
      }
      _likedPosts[index] = !_likedPosts[index];
    });
  }

  _showOverlay(BuildContext context, int index, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _createOverlayEntry(context, index, offset);
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(
      BuildContext context, int index, Offset offset) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              top: offset.dy + 40,
              left: offset.dx - 70,
              child: GestureDetector(
                onTap: () {},
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _hiddenPosts.add(index);
                            });
                            _overlayEntry?.remove();
                          },
                          child: const Text(
                            '非表示',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            '報告',
                            style: TextStyle(color: Colors.red, fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showComments(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CommentSection(postIndex: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push<dynamic>(
                post.route(), // postのルートメソッドを呼び出す
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.add, size: 28.0),
            )),
        title: const Text(
          'eventspot',
          style: TextStyle(color: Colors.blue, fontSize: 30.0),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.of(context).push<dynamic>(
                  JoinedEventList.route(), // postのルートメソッドを呼び出す
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                child: const Icon(Icons.list, size: 28.0),
              )),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push<dynamic>(
                  JoiningEventChat.route(), // postのルートメソッドを呼び出す
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.comment_outlined, size: 28.0),
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20, // 仮の投稿数
              itemBuilder: (context, index) {
                if (_hiddenPosts.contains(index)) {
                  return const SizedBox.shrink(); // 非表示にするために空のウィジェットを返す
                }
                final GlobalKey iconKey = GlobalKey();
                return Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push<dynamic>(
                                      EventDetail.route(), // postのルートメソッドを呼び出す
                                    );
                                  },
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage('public/Vball.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12), // 画像とテキストの間に空白を追加

                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push<dynamic>(
                                      EventDetail.route(), // postのルートメソッドを呼び出す
                                    );
                                  },
                                  child: const Text(
                                    'EventName',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                key: iconKey,
                                onTap: () {
                                  _showOverlay(context, index, iconKey);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child:
                                      const Icon(Icons.more_vert, size: 28.0),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 350, // Swiperに明示的な高さを設定
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset('public/Vball.jpg',
                                width: double.infinity, fit: BoxFit.cover);
                          },
                          itemCount: 3,
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              size: 8.0,
                              activeSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                child: _likedPosts[index]
                                    ? const Icon(Icons.favorite,
                                        size: 26.0,
                                        color: Colors.red,
                                        key: ValueKey('liked'))
                                    : const Icon(Icons.favorite_border,
                                        size: 26.0,
                                        color: Colors.black,
                                        key: ValueKey('unliked')),
                              ),
                              onPressed: () => _toggleLike(index),
                            ),
                            GestureDetector(
                                onTap: () {
                                  _showComments(
                                      context, index); // postのルートメソッドを呼び出す
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: const Icon(Icons.comment_outlined,
                                      size: 26.0),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '「お気に入り！」 ${_likeCounts[index]}件',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: ExpandableText(
                            '4月11日(木)にバレーボール大会を行います！ぜひ参加してください！(質問はコメントにて)',
                            trim: 2,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            readMoreText: 'もっと見る',
                            readLessText: '閉じる',
                            linkTextStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          '2023-05-17', // ここに投稿の日付を設定します
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // 各投稿の間に空白を追加
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
