import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacinandoedu_app/screens/auth/pages/auth_page.dart';
import 'package:vacinandoedu_app/screens/home/pages/initial_page.dart';
import 'package:vacinandoedu_app/screens/home/pages/splash_page.dart';
import 'package:vacinandoedu_app/theme/app_theme.dart';

import 'screens/memory_game/pages/game_manager.dart'; // Importe o provedor

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameManager>(
          create: (_) => GameManager(),
        ),
        Provider<FirebaseAuth>(
          create: (_) => FirebaseAuth.instance,
        ),
        // Outros provedores, se necessário
      ],
      child: MaterialApp(
        title: 'vacinandoedu',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashPage();
            }
            if (snapshot.hasData) {
              return const InitialPage();
            }
            return const AuthPage();
          },
        ),
      ),
    );
  }
}
