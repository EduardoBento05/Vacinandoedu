import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/game_memory_page.dart';
import 'package:vacinandoedu_app/screens/home/pages/initial_page.dart';
import '../../../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {required this.result,
      required this.questionLenght,
      required this.onPressed,
      this.nivel,
      this.fase});

  final int? nivel;
  final int? fase;
  final int result;
  final int questionLenght;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blueEnd,
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Resultado",
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                "$result/$questionLenght",
                style: const TextStyle(fontSize: 30.0),
              ),
              radius: 70.0,
              backgroundColor: result == questionLenght / 2
                  ? Colors.yellow
                  : result < questionLenght / 2
                      ? incorrect
                      : correct,
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLenght / 2
                  ? 'Foi Quase!!'
                  : result < questionLenght / 2
                      ? "Que Pena, Tente Novamente!"
                      : "Parabéns!!",
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton.icon(
              onPressed: () {
                if (nivel == 1 && fase == 1) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage(nivel!, fase! + 1)),
                    (route) => false,
                  );
                } else if (nivel == 1 && fase == 2) {
                  // Se estiver no nível 2, fase 2, vá para a página inicial
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage(nivel! + 1, fase! - 1)),
                    (route) => false,
                  );
                }
                if (nivel == 2 && fase == 2) {
                  // Se estiver no nível 2, fase 2, vá para a página inicial
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => InitialPage()),
                    (route) => false,
                  );
                } else if (nivel == 2 && fase == 1) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage(nivel!, fase! + 1)),
                    (route) => false,
                  );
                }
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                "Avançar",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.refresh),
              label: const Text(
                "Recomeçar",
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
