import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/utils/url/header.dart';

class BaseLayout extends HookConsumerWidget with RouteAware {
  final String title;
  final Widget child;
  final AppBar? appBar;

  const BaseLayout(
      {super.key, required this.title, required this.child, this.appBar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final currentRoute = Navigator.of(context).widget;

    useEffect(() {
      print(currentRoute);
      ref.read(headerProvider.notifier).checkAuth(context);
    }, [currentRoute]);*/

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: appBar ??
            AppBar(
                toolbarHeight: 46,
                title: Text(title),
                backgroundColor: Colors.white),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Container(
          height: deviceHeight - 46.0 - 48.0,
          child: ClipRect(child: child),
        ));
  }
}
