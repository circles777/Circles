import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {
  final String title;
  final String content;
  final dynamic context;
  Alert({required this.title, required this.content, required this.context});

  Future showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text(title,
            style: TextStyle(color: Colors.redAccent, fontSize: 24)),
        content: new Text(content),
        /*actions: <Widget>[
          new SimpleDialogOption(
            child: new Text('Yes'),
            onPressed: () {
              Navigator.pop(context, Answers.YES);
            },
          ),
          new SimpleDialogOption(
            child: new Text('NO'),
            onPressed: () {
              Navigator.pop(context, Answers.NO);
            },
          ),
        ],*/
      ),
    );
    /*switch (value) {
      case Answers.YES:
        _setValue('Yes');
        break;
      case Answers.NO:
        _setValue('NO');
        break;
    }*/
  }
}
