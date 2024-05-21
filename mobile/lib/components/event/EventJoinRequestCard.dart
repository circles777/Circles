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

class EventJoinRequestCard extends ConsumerWidget {
  final EventModel event;
  final User user;
  final void Function()? onTap;

  EventJoinRequestCard(
      {super.key, required this.event, required this.user, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(user.toJson());
    String start_format = DateFormat('MM/dd').format(event.startedAt);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => pushNewScreen<dynamic>(
              context,
              screen: MyProfile(
                  user: ref.read(userProvider.notifier).state ?? mockUser),
              withNavBar: true,
            ),
        child: Container(
            //color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              RowViewWithGap(
                gap: 16,
                children: [
                  Avater(
                    size: 60,
                    image: AssetImage(
                        event.creator.photoUrl ?? 'public/mican.jpeg'),
                  ),
                  Text("${user.lastName} ${user.firstName}"),
                ],
              ),
              RowViewWithGap(gap: 4, children: [
                GestureDetector(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(8, 119, 235, 1)),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                  child: Text(
                    "許可",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )),
                GestureDetector(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(233, 233, 233, 1)),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                  child: Text(
                    "削除",
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                )),
              ])
            ])));
  }
}
