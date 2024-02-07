import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {required this.result,
      required this.questionLenght,
      required this.onPressed});
  final int result;
  final int questionLenght;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blueEnd,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Resultado",
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              child: Text(
                "$result/$questionLenght",
                style: TextStyle(fontSize: 30.0),
              ),
              radius: 70.0,
              backgroundColor: result == questionLenght / 2
                  ? Colors.yellow
                  : result < questionLenght / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              result == questionLenght / 2
                  ? 'Foi Quase!!'
                  : result < questionLenght / 2
                      ? "Que Pena, Tente Novamente!"
                      : "Parabénss!!",
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: onPressed,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    color: Colors.yellow,
                    size: 20.0,
                  ),
                  SizedBox(
                      width: 5.0), // Adicione um espaço entre o ícone e o texto
                  Text(
                    "Recomeçar",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
