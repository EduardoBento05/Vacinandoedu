import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/screens/stage/pages/stage_page.dart';
import 'package:vacinandoedu_app/screens/home/pages/initial_page.dart';
import 'package:vacinandoedu_app/models/start_button.dart';
import '../../../constants.dart';
import '../../group_chat/pages/chat_page.dart';

class Nivel {
  final int number;
  final String title;
  final Color color;
  final Widget page;

  Nivel({
    required this.number,
    required this.title,
    required this.color,
    required this.page,
  });
}

class LevelPage extends StatefulWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  static List<Nivel> niveis = [
    Nivel(
      number: 1,
      title: "Nível - 1: Importância da Vacina",
      color: Colors.white,
      page: StagePage(1, "Nível - 1: Importância da Vacina"),
    ),
    Nivel(
      number: 2,
      title: "Nível - 2: Profissionais da Vacina",
      color: Colors.white,
      page: StagePage(2, "Nível - 2: Profissionais da Vacina"),
    ),
  ];

  Nivel? selectedNivel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grayHighlight,
        shadowColor: Colors.grey[400],
        centerTitle: true,
        title: Text(
          "Níveis",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
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
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Níveis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Pagina Inicial'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InitialPage(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (Nivel nivel in niveis)
                StartButton(
                  title: nivel.title,
                  color: nivel.color,
                  function: () {
                    setState(() {
                      selectedNivel = nivel;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StagePage(
                          nivel.number,
                          selectedNivel?.title ?? 'Níveis',
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(
                height: 40,
              ),
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
