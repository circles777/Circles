import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/common/Avater.dart';
import 'package:mobile/components/common/RowWithGap.dart';
import 'package:mobile/mocks/mocks.dart';
import 'package:mobile/models/event.model.dart';
import 'package:mobile/models/user.model.dart';
import 'package:mobile/providers/user.provider.dart';
import 'package:mobile/screens/Profile/MyProfile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class EventNotificationCard extends ConsumerWidget {
  final EventModel event;
  final User user;
  final void Function()? onTap;
  
  EventNotificationCard(
      {super.key, required this.event, required this.user, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(user.toJson());
    String start_format = DateFormat('MM/dd').format(event.startedAt);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => pushNewScreen<dynamic>(
        context,
        screen:
            MyProfile(user: ref.read(userProvider.notifier).state ?? mockUser),
        withNavBar: true,
      ),
      child: Container(
        //color: Colors.white,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          RowViewWithGap(
        gap: 16,
        children: [
          Avater(
            size: 60,
            image: AssetImage(event.creator.photoUrl ?? 'public/mican.jpeg'),
          ),
          Text("${user.lastName} ${user.firstName}が参加しました"),
        ],
      ),
      Text(start_format)
      ]))
    );
  }
}
