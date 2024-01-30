import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vacinandoedu_app/constants.dart';
import 'package:vacinandoedu_app/widgets/chat_messages.dart';
import 'package:vacinandoedu_app/widgets/new_messages.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    setupPushNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final imageUrl = user?.photoURL;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Dúvidas'),
        centerTitle: true,
        actions: [
          if (imageUrl != null)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
        ],
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
        child: Column(
          children: const [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
