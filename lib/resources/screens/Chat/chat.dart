import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/resources/providers/chat_provider.dart';
import 'package:yes_no_app/resources/widgets/Chat/my_message_bubble.dart';
import 'package:yes_no_app/resources/widgets/Chat/other_message_bubble.dart';
import 'package:yes_no_app/resources/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ryomen Sukuna'),
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static.wikia.nocookie.net/jujutsu-kaisen/images/c/cf/Sukuna_-_Anime.jpg/revision/latest?cb=20201031200402&path-prefix=es'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return message.fromWho == FromWho.others
                      ? OtherMessageBubble(
                          message: message.text, urlImage: message.urlImage!)
                      : MyMessageBubble(
                          message: message.text,
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: MessageFieldBox(
                onValue: (value) => chatProvider.sendMessage(value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
