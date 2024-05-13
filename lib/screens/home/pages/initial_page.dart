import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/screens/level/pages/level_page.dart';
import '../../../models/logo.dart';
import '../../../models/start_button.dart';
import '../../../constants.dart';
import '../../group_chat/pages/chat_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayHighlight,
        shadowColor: Colors.grey[400],
        centerTitle: true,
        title: const Text(
          "VacinandoEdu",
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              StartButton(
                title: 'Jogar',
                color: Colors.white,
                function: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelPage(),
                    )),
              ),
              StartButton(
                title: 'Sair',
                color: Colors.white,
                function: () => FirebaseAuth.instance.signOut(),
              ),
              const SizedBox(height: 40),
            ],
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
