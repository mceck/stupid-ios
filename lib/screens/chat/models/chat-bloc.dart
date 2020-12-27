import 'dart:async';

import 'package:stupid_ios/screens/chat/models/chat-message.dart';
import 'package:stupid_ios/widgets/bloc.dart';

final EMAIL_REGEX = RegExp("[^ @]+@[^ @\\.]+\\.[^ ]+");

class ChatBloc implements Bloc {
  final List<ChatMessage> _messages = [
    ChatMessage(
        fromYou: false,
        message:
            'Hello, if you want to contact me type your email in the message')
  ];
  final _messagesController = StreamController<ChatMessage>.broadcast();

  Stream<ChatMessage> get messagesStream => _messagesController.stream;

  List<ChatMessage> get messages => _messages;

  Future<void> pushMessage(ChatMessage message) async {
    if (message.message.isEmpty) return;
    message.isSending = true;
    _messages.add(message);
    _messagesController.sink.add(message);

    final response = await _sendMessage(message);
    _messages.add(response);
    message.isSending = false;
    _messagesController.sink.add(response);
  }

  @override
  void dispose() {
    _messagesController.close();
  }

  Future<ChatMessage> _sendMessage(ChatMessage message) async {
    await Future.delayed(Duration(seconds: 1));
    if (EMAIL_REGEX.hasMatch(message.message))
      return ChatMessage(fromYou: false, message: 'Thank you');
    else
      return ChatMessage(
          fromYou: false,
          message: 'Tipe your email in the message to contact me');
  }
}
