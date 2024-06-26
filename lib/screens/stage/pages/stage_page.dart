import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/game_memory_page.dart';
import '../../../models/start_button.dart';
import '../../group_chat/pages/chat_page.dart';

// Função para gerar emojis repetidos
String repeatEmojis(String emoji, int count) {
  return List.generate(count, (_) => emoji).join('');
}

class StagePage extends StatelessWidget {
  final int level;
  final String title;

  const StagePage(this.level, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayHighlight,
        shadowColor: Colors.grey[400],
        centerTitle: true,
        title: Text(
          "$title",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              blueStart,
              purpleEnd,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  final fase = index + 1;
                  final faseTitle = "Fase $fase - ";
                  final emojis = repeatEmojis(' 💉', fase);
                  return StartButton(
                      title: faseTitle + emojis,
                      color: Colors.white,
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(level, fase),
                          )));
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
        },
        child: Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
