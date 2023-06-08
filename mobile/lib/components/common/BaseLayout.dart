import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/utils/url/header.dart';

class BaseLayout extends HookConsumerWidget with RouteAware {
  final String title;
  final Widget child;

  const BaseLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final currentRoute = Navigator.of(context).widget;

    useEffect(() {
      print(currentRoute);
      ref.read(headerProvider.notifier).checkAuth(context);
    }, [currentRoute]);*/

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 46,
            title: Text(title),
            backgroundColor: Color.fromARGB(166, 0, 167, 220)),
        body: child,
        bottomNavigationBar: CupertinoTabBar(
            iconSize: 32,
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
            activeColor: Color.fromARGB(166, 207, 0, 210),
            backgroundColor: Color.fromARGB(166, 0, 167, 220),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart_fill)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.mail)),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person))
            ]));
  }
}
