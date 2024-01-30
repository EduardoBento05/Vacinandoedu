import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/pages/initial_page.dart';
import 'package:vacinandoedu_app/pages/login_page.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  StreamSubscription? streamSubscription;

  @override
  initState() {
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("Não tem usuário logado");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } else {
        print("Usuário Logado");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InitialPage(),
            ));
      }
    });
  }

  @override
  void dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
