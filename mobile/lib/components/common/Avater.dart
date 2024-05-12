import 'package:flutter/material.dart';
import 'package:mobile/screens/Circle/CircleDetail.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Avater extends StatelessWidget {
  //classは設計図、wideetはスクリーンはフック　コンポーネントはステイとレス
  final ImageProvider image;
  final double? size;
  const Avater({super.key, required this.image, this.size}); //呪文

  @override //StatelessWidget の内容つかうため
  Widget build(BuildContext context) {
    Future<dynamic> pushCircleDetail() => Navigator.of(context).push<dynamic>(
          CircleDetail.route(),
        );

    return GestureDetector(
      //GestureDetectorは
      onTap: () => pushNewScreen<dynamic>(
        context,
        screen: CircleDetail(),
        withNavBar: false,
      ),
      child: Container(
        width: size ?? 60,
        height: size ?? 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
