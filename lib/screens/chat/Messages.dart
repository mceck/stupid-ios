import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stupid_ios/screens/chat/EmojiText.dart';
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
                return ListView.builder(
                  itemCount: bloc.messages.length,
                  itemBuilder: ((ctx, i) {
                    final m = bloc.messages[i];
                    return Row(
                      mainAxisAlignment: m.fromYou
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        MessageTile(m, isLast: i == bloc.messages.length - 1),
                      ],
                    );
                  }),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CupertinoTextField(
            onSubmitted: (_) {
              bloc.pushMessage(ChatMessage(message: _message.text));
              setState(() {
                _message.text = '';
              });
            },
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black12),
            ),
            suffix: Container(
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              margin: const EdgeInsets.all(2),
              child: IconButton(
                onPressed: () {
                  bloc.pushMessage(ChatMessage(message: _message.text));
                  setState(() {
                    _message.text = '';
                  });
                },
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
            controller: _message,
            placeholder: 'Message',
            maxLength: 500,
          ),
        ),
      ],
    );
  }
}

class MessageTile extends StatelessWidget {
  final ChatMessage message;
  final bool isLast;

  const MessageTile(this.message, {this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MessageBubble(message: message),
        if (message.isSending)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Text(
              'Sending...',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        if (isLast && message.timestamp != null && message.isSending != true)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Text(
              DateFormat('E HH:mm').format(message.timestamp),
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: message.fromYou ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: message.fromYou
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              EmojiText(
                message.message,
                style: TextStyle(
                    color: message.fromYou ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
        Positioned(
            left: message.fromYou ? null : 25,
            right: message.fromYou ? 25 : null,
            bottom: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: message.fromYou ? Colors.blue : Colors.grey[300],
                borderRadius: message.fromYou
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(-20),
                      )
                    : BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(-20),
                      ),
              ),
              transform:
                  message.fromYou ? Matrix4.skewX(0.5) : Matrix4.skewX(-0.5),
            ))
      ],
    );
  }
}
