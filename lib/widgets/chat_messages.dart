import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacinandoedu_app/models/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('Nenhuma Mensagem Encontrada'),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Erro Inesperado'),
          );
        }

        final loadedMessages = snapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 13,
            right: 13,
          ),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (context, index) {
            final chatMessage = loadedMessages[index].data();
            final nextChatMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data()
                : null;
            final currentMessageUserId = chatMessage['userId'];
            final nextMessageUserUserId =
                nextChatMessage != null ? nextChatMessage['userId'] : null;

            final nextUserIsSame =
                nextMessageUserUserId == currentMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                  message: chatMessage['text'],
                  isMe: authenticatedUser.uid == currentMessageUserId);
            } else {
              return MessageBubble.first(
                  userImage: chatMessage['userImage'],
                  username: chatMessage['username'],
                  message: chatMessage['text'],
                  isMe: authenticatedUser.uid == currentMessageUserId);
            }
          },
        );
      },
    );
  }
}
