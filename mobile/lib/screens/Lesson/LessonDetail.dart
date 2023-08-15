import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:measured_size/measured_size.dart';
import 'package:mobile/components/common/BaseLayout.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';
import 'package:mobile/components/common/ListViewWithGap.dart';
import 'package:mobile/components/lesson/LessonCommentCard.dart';
import 'package:mobile/components/lesson/LessonDetailCard.dart';

class LessonDetail extends HookWidget {
  final DateTime date;
  final String name;
  final List<String> tags;

  const LessonDetail(
      {super.key, required this.date, required this.name, required this.tags});

  static Route<dynamic> route({
    required DateTime date,
    required String name,
    required List<String> tags,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => LessonDetail(date: date, name: name, tags: tags),
      //settings: RouteSettings(arguments: someId),
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
    return (BaseLayout(
        title: "講義口コミ",
        child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: ColumnViewWithGap(gap: 8, children: [
              MeasuredSize(
                  onChange: (Size size) => {
                        detailHeight.value = size.height,
                        //print('yeyy' + detailHeight.value.toString())
                      },
                  child: LessonDetailCard(
                      date: DateTime.now(),
                      name: name,
                      tags: tags,
                      commentNum: 127)),
              Container(
                height: listHeight.value,
                child: ListViewWithGap(
                    gap: 8.0,
                    children: <Widget>[] +
                        list
                            .map((l) => LessonCommentCard(
                                date: DateTime.now(),
                                content:
                                    "この講義は基礎講義で電気電子情報工学科の生徒は全員受けなければいけない講義です。難易度としては毎週授業に出ていればそれほど難しくはありません。"))
                            .toList()),
              ),
            ]))));
  }
}
