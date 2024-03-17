import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Chat(
        messages: [
          type.TextMessage.fromPartial(
              author: type.User(id: "randomID"),
              id: "id",
              partialText: type.PartialText(text: "HALO")),
          type.TextMessage.fromPartial(
              author: type.User(id: "randomID2"),
              id: "id1",
              partialText: type.PartialText(text: "HALO Kamu"))
        ],
        onSendPressed: (message) {},
        user: type.User(id: "randomID"),
      ),
    );
  }
}
