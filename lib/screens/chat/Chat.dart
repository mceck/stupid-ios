import 'package:flutter/material.dart';
import 'package:stupid_ios/screens/chat/Messages.dart';
import 'package:stupid_ios/screens/chat/models/chat-bloc.dart';
import 'package:stupid_ios/screens/chat/models/chat-message.dart';
import 'package:stupid_ios/widgets/BlocProvider.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue),
        backgroundColor: Colors.grey[200],
        elevation: 1,
        toolbarHeight: 90,
        flexibleSpace: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              width: 50,
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.asset('resource/image/profile.jpg'),
            ),
            Text(
              'Mattia',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: BlocProvider<ChatBloc>(
        bloc: ChatBloc(),
        child: Messages(),
      ),
    );
  }
}
