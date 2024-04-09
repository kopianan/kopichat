import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:kopichat/application/authentication/authentication_cubit.dart';
import 'package:kopichat/application/chat_data/chat_data_cubit.dart';
import 'package:kopichat/application/message/bloc/message_bloc.dart';
import 'package:kopichat/application/room/room_cubit.dart';
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
  final messageCubit = getIt<MessageBloc>();
  final chatDataCubit = getIt<ChatDataCubit>();
  late type.Room room;

  void onSendPressed(type.PartialText message) {
    //send message
    messageCubit.add(SendMessageEvent(message, room.id));
  }

  @override
  void initState() {
    room = widget.room;
    super.initState();
  }

  @override
  void dispose() {
    //get last message
    final last = chatDataCubit.state.lastMessage;

    if (last != null) {
      final newRoom = room.copyWith(
        lastMessages: [last as type.TextMessage],
        updatedAt: last.updatedAt,
      );
      getIt<RoomCubit>().updateRoom(newRoom);
    }
    messageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => chatDataCubit..setCurrentRoom(room),
        ),
        BlocProvider(
            create: (context) => messageCubit..add(WatchAllMessageEvent(room))),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(room.name ?? ""),
        ),
        body: BlocListener<MessageBloc, MessageState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loadSuccess: (e) {
                if (e.messages.isNotEmpty) {
                  chatDataCubit.setLastMessage(e.messages.first);
                }
              },
            );
          },
          child: BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return Container();
                },
                loadSuccess: (value) {
                  final currUserId =
                      getIt<AuthenticationCubit>().state.getUserId;
                  final currUser = room.users
                      .firstWhere((element) => element.id == currUserId);
                  return Chat(
                    onAttachmentPressed: () {
                      onAttachmentPressed(context);
                    },
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
      ),
    );
  }

  Future<dynamic> onAttachmentPressed(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Attachment",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80, crossAxisSpacing: 15),
                  children: const [
                    AttachmentMenuWidget(
                      iconData: Icons.image,
                      label: "Gallery",
                    ),
                    AttachmentMenuWidget(
                      iconData: Icons.camera,
                      label: "Camera",
                    ),
                    AttachmentMenuWidget(
                      iconData: Icons.multitrack_audio_sharp,
                      label: "Audio",
                    ),
                    AttachmentMenuWidget(
                      iconData: Icons.file_copy,
                      label: "File",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        });
  }
}

class AttachmentMenuWidget extends StatelessWidget {
  const AttachmentMenuWidget({
    super.key,
    required this.label,
    required this.iconData,
    this.onTap,
  });
  final String label;
  final IconData iconData;
  final Function()? onTap;

  Color generateColorFromText(String text) {
    // Initialize a random number generator with a seed based on the text
    Random random = Random(text.hashCode);

    // Generate random RGB values
    int red = random.nextInt(256); // 0 to 255
    int green = random.nextInt(256); // 0 to 255
    int blue = random.nextInt(256); // 0 to 255

    // Combine the components into a color
    Color color = Color.fromARGB(255, red, green, blue);

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 25,
            foregroundColor: Colors.white,
            backgroundColor: generateColorFromText(label),
            child: Icon(iconData),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
