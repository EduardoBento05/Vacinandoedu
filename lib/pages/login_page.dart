import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/pages/initial_page.dart';
import 'package:vacinandoedu_app/pages/register_page.dart';
import 'package:vacinandoedu_app/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 173, 0, 203),
              Color.fromARGB(255, 227, 112, 248),
            ],
          ),
        ),
        child: ListView(padding: const EdgeInsets.all(12), children: [
          const Logo(),
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "e-mail",
              labelStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white),
              ),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "senha",
              labelStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.white),
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 45),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: const Text(
              "Entrar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            ),
            child: const Text(
              "Cadastrar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        _emailController.clear();
        _passwordController.clear();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InitialPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Usuário não encontrado"),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Senha incorreta"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
