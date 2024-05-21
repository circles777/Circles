import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/event/EventJoinRequestCard.dart';
import 'package:mobile/components/event/EventNotificationCard.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/providers/user.provider.dart';

class EventJoinRequest extends ConsumerWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EventJoinRequest(),
      //settings: RouteSettings(arguments: someId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, title: Text("参加リクエスト")),
        body: Container(
          color: Colors.white,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: ListViewWithGap(
              horizontal: false,
              gap: 8,
              children: List.generate(
                  8,
                  (index) => EventJoinRequestCard(
                      event: mockEvent11,
                      user: ref.read(userProvider.notifier).state ?? mockUser)),
            )));
  }
}
