import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? OtherMessageBubble()
                    : MyMessageBubble();
              },
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: MessageFieldBox(),
            )
          ],
        ),
      ),
    );
  }
}
