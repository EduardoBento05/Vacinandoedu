import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vacinandoedu_app/matched_animation.dart';
import 'package:vacinandoedu_app/models/game_manager.dart';
import 'package:vacinandoedu_app/models/word.dart';
import 'package:vacinandoedu_app/widgets/flip_animation.dart';

class WordTile extends StatelessWidget {
  const WordTile({Key? key, required this.index, required this.word})
      : super(key: key);
  final int index;
  final Word word;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameManager>(
      builder: (_, notifier, __) {
        bool animate = checkAnimationRun(notifier);
        return GestureDetector(
          onTap: () {
            if (!notifier.ignoreTaps &&
                !notifier.answeredWords.contains(index) &&
                !notifier.tappedWords.containsKey(index)) {
              print(index);
              notifier.titleTapped(index: index, word: word);
            }
          },
          child: FlipAnimation(
            delay: notifier.reverseFlip ? 1500 : 0,
            reverse: notifier.reverseFlip,
            animationCompleted: (completed) {
              print("$completed");
              notifier.onAnimationCompleted(isFoward: completed);
            },
            animate: animate,
            word: MatchedAnimation(
              numberOfWordsAnswered: notifier.answeredWords.length,
              animate: notifier.answeredWords.contains(index),
              child: Container(
                padding: EdgeInsets.all(16),
                child: word.displayText
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Transform(
                          transform: Matrix4.rotationY(pi),
                          alignment: Alignment.center,
                          child: Text(
                            word.text,
                            style: GoogleFonts.bubblegumSans(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : Image.network(word.url),
              ),
            ),
          ),
        );
      },
    );
  }

  bool checkAnimationRun(GameManager notifier) {
    bool animate = false;

    if (notifier.canFlip) {
      if (notifier.tappedWords.isNotEmpty &&
          notifier.tappedWords.keys.last == index) {
        animate = true;
      }
      if (notifier.reverseFlip && !notifier.answeredWords.contains(index)) {
        animate = true;
      }
    }
    return animate;
  }
}
