import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/models/info_card.dart';

import '../models/game_logic.dart';

class MemoryPage extends StatefulWidget {
  final int nivel;
  final int fase;

  const MemoryPage(this.nivel, this.fase);

  @override
  State<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  Game _game = Game();
  int tentativas = 0;
  int pontuacao = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame(widget.fase);
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    bool hideTest = false;

    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Fase - ${widget.fase}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                info_card("Vezes", "$tentativas"),
                info_card("Pontos", "$pontuacao"),
              ],
            ),
            SizedBox(
              height: screen_width,
              width: screen_width,
              child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print(_game.cards_list[index]);
                        setState(() {
                          tentativas++;
                          _game.gameImg![index] = _game.cards_list[index];
                          _game.matchCheck
                              .add({index: _game.cards_list[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print("true");
                            pontuacao += 20;
                            _game.matchCheck.clear();
                          } else {
                            print(false);
                            Future.delayed(Duration(milliseconds: 500), () {
                              print(_game.gameImg);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}
