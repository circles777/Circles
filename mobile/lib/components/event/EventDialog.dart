import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/common/ColumnWithGap.dart';

class EventDialog extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SimpleDialog(
      title: ColumnViewWithGap(gap: 8, children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              width: 41,
              height: 8,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(15)),
            )),
        Text(
          '並び替え',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        )
      ]),
      titlePadding: EdgeInsets.only(left: 24, top: 10),
      //contentPadding: EdgeInsets.only(),
      insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      alignment: Alignment.bottomCenter,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      children: [
        Container(
          width: deviceWidth,
        ),
        SimpleDialogOption(
          child: Text("選択肢1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.pop(context, 'aaa');
          },
        ),
        SimpleDialogOption(
          child: Text('選択肢2',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.pop(context, 'aa');
          },
        ),
        TextButton(
          child: Align(
              alignment: Alignment.center,
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
                  child: Container(
                      width: deviceWidth,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(52, 170, 255, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 2),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('適用',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      )))),
          onPressed: () {
            Navigator.pop(context, '');
          },
        ),
      ],
    );
  }
}
