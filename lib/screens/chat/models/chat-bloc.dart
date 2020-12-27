import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stupid_ios/screens/chat/models/chat-message.dart';
import 'package:stupid_ios/widgets/bloc.dart';

final kEmailRegExp = RegExp("([^ @]+@[^ @\\.]+\\.[^ ]+)");

class ChatBloc implements Bloc {
  final List<ChatMessage> _messages = [
    ChatMessage(
      fromYou: false,
      message:
          'Hello, if you want to contact me type your email in the message',
      timestamp: DateTime.now(),
    ),
  ];
  final _messagesController = StreamController<ChatMessage>.broadcast();

  Stream<ChatMessage> get messagesStream => _messagesController.stream;

  List<ChatMessage> get messages => _messages;

  Future<void> pushMessage(ChatMessage message) async {
    if (message.message.isEmpty) return;
    message.isSending = true;
    message.timestamp = DateTime.now();
    _messages.add(message);
    _messagesController.sink.add(message);

    final response = await _sendMessage(message);
    response.timestamp = DateTime.now();
    _messages.add(response);
    message.isSending = false;
    _messagesController.sink.add(response);
  }

  @override
  void dispose() {
    _messagesController.close();
  }

  Future<ChatMessage> _sendMessage(ChatMessage message) async {
    if (kEmailRegExp.hasMatch(message.message)) {
      final email = kEmailRegExp.firstMatch(message.message).group(0);
      message.message = message.message.replaceFirst(email, '').trim();
      final bodyStr = json.encode({'email': email, 'message': message.message});
      final result = await http.post(
        'https://mcdev-bot.herokuapp.com/contact-me',
        headers: {'content-type': 'application/json'},
        body: bodyStr,
      );
      if (result.statusCode == 200)
        return ChatMessage(fromYou: false, message: 'Thank you $email');
      return ChatMessage(
          fromYou: false, message: 'Wooops! Sorry... Retry later');
    } else
      return ChatMessage(
          fromYou: false,
          message:
              'Please, type your email in the message to be able to contact me');
  }
}
