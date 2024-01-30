import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget(
      {required this.question,
      required this.indexAction,
      required this.totalQuestions});

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        'Pergunta ${indexAction + 1}/$totalQuestions: $question',
        style: TextStyle(
          fontSize: 24.0,
          color: neutral,
        ),
      ),
    );
  }
}
