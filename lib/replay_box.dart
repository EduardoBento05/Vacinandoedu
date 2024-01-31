import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacinandoedu_app/models/game_manager.dart';
import 'package:vacinandoedu_app/pages/game_memory_page.dart';
import 'package:vacinandoedu_app/pages/questions_page.dart';

const messages = ['Parabénsss!', 'Incrível!', "Arrasou!", "Você é Fantástico!"];

class ReplayBox extends StatelessWidget {
  final int nivel;
  final int fase;

  const ReplayBox(this.nivel, this.fase);

  @override
  Widget build(BuildContext context) {
    final r = Random().nextInt(messages.length);
    String message = messages[r];

    return AlertDialog(
      title: Text(
        message,
        textAlign: TextAlign.center,
      ),
      content: Text(
        '😎',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 60),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => GamePage(nivel, fase),
                ),
                (route) => false),
            child: Text(
              "Recomeçar",
              textAlign: TextAlign.center,
              textScaler: TextScaler.noScaling,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionPage(nivel, fase),
                )),
            child: Text("Avançar"),
          ),
        ),
      ],
    );
  }
}
