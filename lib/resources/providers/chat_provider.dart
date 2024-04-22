import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [Message(text: 'Hola', fromWho: FromWho.me)];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.me);
    messages.add(newMessage);
    if (message.endsWith('?')) await othersReplay();
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> othersReplay() async {
    final otherMessage = await getYesNoAnswer.getAnswer();

    messages.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
