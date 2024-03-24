import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:kopichat/application/authentication/authentication_cubit.dart';
import 'package:kopichat/application/message/message_cubit.dart';
import 'package:kopichat/injectable.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.room,
  });
  final type.Room room;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageCubit = getIt<MessageCubit>();
  late type.Room room;

  void onSendPressed(type.PartialText message) {
    //send message
    messageCubit.sendTextMessage(message, room.id);
  }

  @override
  void initState() {
    room = widget.room;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => messageCubit..streamMessages(room),
      child: Scaffold(
        appBar: AppBar(
          title: Text(room.name ?? ""),
        ),
        body: BlocBuilder<MessageCubit, MessageState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () {
                return Container();
              },
              onMessages: (value) {
                final currUserId = getIt<AuthenticationCubit>().state.getUserId;
                final currUser = room.users
                    .firstWhere((element) => element.id == currUserId);
                return Chat(
                  showUserAvatars: true,
                
                  messages: value.messages,
                  onSendPressed: onSendPressed,
                  user: currUser,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
