import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/widgets/start_button.dart';

import '../models/fase.dart';

class FaseWidget extends StatelessWidget {
  final Fase fase;

  FaseWidget({required this.fase});

  @override
  Widget build(BuildContext context) {
    return StartButton(
      title: fase.title,
      color: Colors.white,
      function: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => fase.widget,
        ),
      ),
    );
  }
}
