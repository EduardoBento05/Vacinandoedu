import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({required this.options, required this.color});

  final String options;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          options,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            color: color.red != color.green ? neutral : Colors.black,
          ),
        ),
      ),
    );
  }
}
