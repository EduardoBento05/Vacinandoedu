import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/models/audio_manager.dart';
import 'package:vacinandoedu_app/screens/memory_game/pages/word.dart';

class GameManager extends ChangeNotifier {
  Map<int, Word> tappedWords = {};
  bool canFlip = false,
      reverseFlip = false,
      ignoreTaps = false,
      isMusicPlaying = false,
      roundedCompleted = false;

  List<int> answeredWords = [];

  // Adicionada variável currentFase
  int currentFase = 0; // Defina o valor inicial conforme necessário

  // Adicionado mapa para armazenar o número total de palavras por fase

  titleTapped({required int index, required Word word}) {
    ignoreTaps = true;
    if (tappedWords.length <= 1) {
      tappedWords.addEntries([MapEntry(index, word)]);
      canFlip = true;
    } else {
      canFlip = false;
    }

    notifyListeners();
  }

  onAnimationCompleted({required bool isFoward}) async {
    if (tappedWords.length == 2) {
      if (isFoward) {
        if (tappedWords.entries.elementAt(0).value.text ==
            tappedWords.entries.elementAt(1).value.text) {
          answeredWords.addAll(tappedWords.keys);

          // Alteração aqui: verificar se todas as palavras foram respondidas
          if (answeredWords.length == _calculateQuantidadeCartas()) {
            await AudioManager.playAudio('round');
            print("jogo concluído 2");
            roundedCompleted = true;
          } else {
            await AudioManager.playAudio('correct');
          }

          tappedWords.clear();
          canFlip = true;
          ignoreTaps = false;
        } else {
          await AudioManager.playAudio('Incorrect');
          reverseFlip = true;
        }
      } else {
        reverseFlip = false;
        tappedWords.clear();
        ignoreTaps = false;
      }
    } else {
      canFlip = false;
      ignoreTaps = false;
    }

    notifyListeners();
  }

  // Adicionada função para calcular o total de palavras com base na fase
  int _calculateQuantidadeCartas() {
    switch (currentFase) {
      case 1:
        return 6;
      case 2:
        return 8;
      case 3:
        return 10;
      default:
        throw Exception("Fase não reconhecida: $currentFase");
    }
  }

  void resetGame() {
    tappedWords.clear();
    canFlip = false;
    reverseFlip = false;
    ignoreTaps = false;
    roundedCompleted = false;
    answeredWords.clear();

    // Reinicie qualquer outra variável de estado que seja necessária.

    notifyListeners();
  }

  void setFase(int fase) {
    currentFase = fase;
  }
}
