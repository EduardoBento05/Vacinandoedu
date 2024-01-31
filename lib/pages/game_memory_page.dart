import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/main.dart';
import 'package:vacinandoedu_app/models/game_manager.dart';
import 'package:vacinandoedu_app/models/nivel.dart';
import 'package:vacinandoedu_app/models/word_tile.dart';
import 'package:vacinandoedu_app/replay_box.dart';

import '../models/word.dart';

class GamePage extends StatefulWidget {
  final int nivel;
  final int fase;

  const GamePage(
    this.nivel,
    this.fase,
  );

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Word> _gridWords = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<GameManager>(context, listen: false).resetGame();
      GameManager gameManager =
          Provider.of<GameManager>(context, listen: false);
      gameManager.setFase(widget.fase);
      _setUp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;

    return FutureBuilder(
      future: _cacheImages(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Algo deu errado. ${snapshot.error}",
            textAlign: TextAlign.center,
          );
        }
        if (snapshot.hasData) {
          return Selector<GameManager, bool>(
            selector: (_, gameManager) => gameManager.roundedCompleted,
            builder: (_, roundedCompleted, __) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (roundedCompleted) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => ReplayBox(widget.nivel, widget.fase),
                  );
                }
              });

              return Scaffold(
                backgroundColor: background,
                appBar: AppBar(
                    backgroundColor: shadorcolortopbar,
                    centerTitle: true,
                    title: Text("Nivel ${widget.nivel}/Fase - ${widget.fase}"),
                    actions: [
                      IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.more_vert_outlined))
                    ]),
                body: SafeArea(
                  child: Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        left: widthPadding,
                        right: widthPadding,
                      ),
                      itemCount: _gridWords.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) => WordTile(
                        index: index,
                        word: _gridWords[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _setUp() {
    _gridWords.clear();

    List<Word> nivelWords;

    switch (widget.nivel) {
      case 1:
        nivelWords = nivel1Words;
        break;
      case 2:
        nivelWords = nivel2Words;
        break;
      case 3:
        nivelWords = nivel3Words;
        break;
      default:
        throw Exception("Nível não reconhecido: ${widget.nivel}");
    }

    nivelWords.shuffle();

    for (int i = 0; i < _calculateQuantidadeCartas(); i++) {
      Word originalWord = nivelWords[i];
      _gridWords.add(originalWord);
      _gridWords.add(
        Word(
          text: originalWord.text,
          url: originalWord.url,
          displayText: true,
        ),
      );
    }

    _gridWords.shuffle();
  }

  int _calculateQuantidadeCartas() {
    switch (widget.fase) {
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 5;
      default:
        throw Exception("Fase não reconhecida: ${widget.fase}");
    }
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  }

  /**_setUp() {
    nivel1Words.shuffle();
    for (int i = 0; i < 3; i++) {
      _gridWords.add(nivel1Words[i]);
      _gridWords.add(Word(
          text: nivel1Words[i].text,
          url: nivel1Words[i].url,
          displayText: true));
    }
    _gridWords.shuffle();
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  } */
}
