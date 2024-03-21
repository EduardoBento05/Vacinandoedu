import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vacinandoedu_app/firebase_options.dart';
import 'package:vacinandoedu_app/models/word.dart';
import 'package:vacinandoedu_app/pages/auth_page.dart';

import './app.dart';

List<Word> nivel1Words = [];
List<Word> nivel2Words = [];

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FutureBuilder(
    future: Future.wait([
      populateSourceWords(),
      populateNivel2Words(),
    ]),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Material(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Erro ao acessar o conteúdo.",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPage(),
                        ));
                  },
                  child: Text("Fazer login"),
                ),
              ],
            ),
          ),
        );
      }

      if (snapshot.hasData) {
        print("Deu bão, ${nivel1Words.length}");
        return const App();
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  ));
}

Future<int> populateSourceWords() async {
  final ref = FirebaseStorage.instance.ref().child('memory_game/Nivel1');

  final all = await ref.listAll();

  for (var item in all.items) {
    nivel1Words.add(
      Word(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false),
    );
  }

  return 1;
}

Future<int> populateNivel2Words() async {
  final ref = FirebaseStorage.instance.ref().child('memory_game/Nivel2');
  final all = await ref.listAll();

  for (var item in all.items) {
    nivel2Words.add(
      Word(
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL(),
          displayText: false),
    );
  }

  return 1;
}
