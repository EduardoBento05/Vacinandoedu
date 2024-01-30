import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/images/hidden.png";
  List<String> cards_list = [
    "assets/images/circle.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/star.png",
    "assets/images/heart.png",
  ];

  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame(int fase) {
    int cardCount = 0;
    if (fase == 1) {
      cardCount = 4;
    } else if (fase == 2) {
      cardCount = 6;
    } else if (fase == 3) {
      cardCount = 8;
    }

    // Gera as cartas aleatoriamente
    List<int> availableIndexes =
        List.generate(cards_list.length, (index) => index);
    availableIndexes.shuffle();
    availableIndexes = availableIndexes.sublist(0, cardCount);

    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
