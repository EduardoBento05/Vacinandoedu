import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/pages/configuration_page.dart';
import 'package:vacinandoedu_app/pages/fase_page.dart';
import 'package:vacinandoedu_app/pages/initial_page.dart';
import 'package:vacinandoedu_app/widgets/start_button.dart';
import '../constants.dart';
import 'chat_page.dart';

class Nivel {
  final int numero;
  final String title;
  final Color color;
  final Widget page;

  Nivel({
    required this.numero,
    required this.title,
    required this.color,
    required this.page,
  });
}

class NiveisPage extends StatefulWidget {
  const NiveisPage({Key? key}) : super(key: key);

  @override
  State<NiveisPage> createState() => _NiveisPageState();
}

class _NiveisPageState extends State<NiveisPage> {
  static List<Nivel> niveis = [
    Nivel(
      numero: 1,
      title: "Nível - 1: A História da Vacina",
      color: Colors.white,
      page: FasePage(1, "Nível - 1: A História da Vacina"),
    ),
    Nivel(
      numero: 2,
      title: "Nível - 2: Importância da Vacina",
      color: Colors.white,
      page: FasePage(2, "Nível - 2: Importância da Vacina"),
    ),
    Nivel(
      numero: 3,
      title: "Nível - 3: Profissionais da Vacina",
      color: Colors.white,
      page: FasePage(3, "Nível - 3: Profissionais da Vacina"),
    ),
  ];

  Nivel? selectedNivel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        shadowColor: Colors.transparent,
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
              title: Text('Home'),
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
            ListTile(
              title: Text('Configurations'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigurationPage()),
                );
              },
            ),
            ListTile(
              title: Text('Sound'),
              leading: Icon(Icons.audiotrack),
              onTap: () {},
            ),
          ],
        ),
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
                        builder: (context) => FasePage(
                          nivel.numero,
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
