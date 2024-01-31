import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/pages/game_memory_page.dart';
import 'package:vacinandoedu_app/pages/memory_page.dart';
import './questions_page.dart'; // Corrigido o nome do arquivo

import '../widgets/start_button.dart';
import 'chat_page.dart';

class FasePage extends StatelessWidget {
  final int nivel;
  final String titulo;

  const FasePage(this.nivel, this.titulo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "$titulo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 173, 0, 203),
              Color.fromARGB(255, 227, 112, 248),
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  final fase = index + 1;
                  final faseTitle = "Fase $fase - ";
                  return StartButton(
                      title: faseTitle,
                      color: Colors.white,
                      function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(nivel, fase),
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
