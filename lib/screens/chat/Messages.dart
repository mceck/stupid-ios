import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/chat/models/chat-bloc.dart';
import 'package:stupid_ios/screens/chat/models/chat-message.dart';
import 'package:stupid_ios/widgets/BlocProvider.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  TextEditingController _message = TextEditingController();

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChatBloc>(context);
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<Object>(
              stream: bloc.messagesStream,
              builder: (context, snapshot) {
                return ListView(
                  children: bloc.messages
                      .map((m) => Row(
                            mainAxisAlignment: m.fromYou
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              MessageTile(m),
                            ],
                          ))
                      .toList(),
                );
              }),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Message'),
          controller: _message,
          maxLength: 500,
        ),
        RaisedButton(
          onPressed: () {
            bloc.pushMessage(ChatMessage(message: _message.text));
          },
          child: Text('test'),
        )
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  final ChatMessage message;

  const MessageTile(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: message.fromYou ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment:
            message.fromYou ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(message.message),
          if (message.isSending) Text('Sending...')
        ],
      ),
    );
  }
}
