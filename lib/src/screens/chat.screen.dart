import 'package:flutter/material.dart';
import 'package:startyo/src/widgets/component/messages.component.dart';
import 'package:startyo/src/widgets/component/newMessage.component.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage()
        ],
      ),
    );
  }
}
