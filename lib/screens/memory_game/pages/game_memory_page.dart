import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/main.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/game_manager.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/word_tile.dart';
import 'package:vacinandoedu_app/screens/home/pages/initial_page.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/replay_box.dart';
import 'word.dart';

class GamePage extends StatefulWidget {
  final int level;
  final int stage;

  const GamePage(
    this.level,
    this.stage,
  );

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Word> _gridWords = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameManager>(context, listen: false).resetGame();
      GameManager gameManager =
          Provider.of<GameManager>(context, listen: false);
      gameManager.setFase(widget.stage);
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
                    builder: (context) => ReplayBox(widget.level, widget.stage),
                  );
                }
              });

              return Scaffold(
                appBar: AppBar(
                  backgroundColor: grayHighlight,
                  shadowColor: Colors.grey[400],
                  centerTitle: true,
                  title: Text("level ${widget.level}/stage - ${widget.stage}"),
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
                  child: SafeArea(
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

    List<Word> levelWords;

    switch (widget.level) {
      case 1:
        levelWords = nivel1Words;
        break;
      case 2:
        levelWords = nivel2Words;
        break;
      default:
        throw Exception("Nível não reconhecido: ${widget.level}");
    }

    levelWords.shuffle();

    for (int i = 0; i < _calculateNumberOfCards(); i++) {
      Word originalWord = levelWords[i];
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

  int _calculateNumberOfCards() {
    switch (widget.stage) {
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 5;
      default:
        throw Exception("stage não reconhecida: ${widget.stage}");
    }
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }

    return 1;
  }
}
