import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:measured_size/measured_size.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/lesson/LessonCommentCard.dart';
import 'package:mobile/components/lesson/LessonDetailCard.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:mobile/components/lesson/LessonCommentCard.dart';
import 'package:mobile/components/lesson/LessonDetailCard.dart';
import 'package:mobile/components/lesson/LessonListCard.dart';

class LessonList extends HookWidget {
  LessonList({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => LessonList(),
    );
  }
@override
 Widget build(BuildContext context) {
    const list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final detailHeight = useState<double>(0);
    final listHeight = useState<double>(0);
    final double deviceHeight = MediaQuery.of(context).size.height;
    useEffect(() {
      listHeight.value = deviceHeight - 46.0 - 48.0 - 16 - detailHeight.value;
      //print(listHeight.value.toString());
    }, [detailHeight.value, deviceHeight]);

  return BaseLayout(
    title:"講義リスト",
    child:Padding(padding: EdgeInsets.fromLTRB(8,16,8,8),
    child: ColumnViewWithGap(gap:8, children: [
      MeasuredSize(

                  onChange: (Size size) => {
                    detailHeight.value = size.height,
                      },
                  child: LessonListCard(
                      date: DateTime.now(),
                      name: "基礎電気数学及び演習",
                      tags: ["電気電子情報工学科",],
                      color:Color.fromARGB(161, 18, 189, 2),
                      commentNum: 128)),
      MeasuredSize(

                  onChange: (Size size) => {
                    detailHeight.value = size.height,
                      },
                  child: LessonListCard(
                      date: DateTime.now(),
                      name: "哲学1A",
                      tags: ["一般教養",],
                     color:Color.fromRGBO(206, 0, 210, 0.63),
                      commentNum: 56)),
      MeasuredSize(

                  onChange: (Size size) => {
                    detailHeight.value = size.height,
                      },
                  child: LessonListCard(
                      date: DateTime.now(),
                      name: "制御工学1",
                      tags: ["電気電子情報工学科","機械工学科"],
                      color:Color.fromARGB(161, 18, 189, 2),
                      commentNum: 76)),
                      
    ],),
    )
  );
}
}
