// ignore: file_names
import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String question;

  final String hiragana;
  final String pronunciation;
  final String meaning;
  const WordCard(
      {super.key,
      required this.question,
      required this.hiragana,
      required this.pronunciation,
      required this.meaning});

  @override
  Widget build(BuildContext context) {
    return (Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromRGBO(251, 140, 106, 0.5)),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(question, style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 4,
            ),
            Text(hiragana),
            const SizedBox(
              height: 4,
            ),
            Text(pronunciation),
            const SizedBox(
              height: 4,
            ),
            Text(meaning)
          ],
        )));
  }
}
