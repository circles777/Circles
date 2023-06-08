import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessDialog {
  final String title;
  final String content;
  final dynamic context;
  SuccessDialog(
      {required this.title, required this.content, required this.context});

  Future showAlert() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
        title: new Text(title,
            style: TextStyle(color: Colors.blueAccent, fontSize: 24)),
        content: new Text(content),
      ),
    );
  }
}
