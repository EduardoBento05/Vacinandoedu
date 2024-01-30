import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset(
            'assets/images/logo3.png',
            width: 100,
            height: 125,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: RichText(
            text: TextSpan(
                text: 'VacinandoEdu',
                style:
                    DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
                children: const [
                  TextSpan(
                    text: ' um Jogo educacional',
                    style: TextStyle(color: Colors.amber),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
