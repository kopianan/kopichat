import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:kopichat/application/authentication/authentication_cubit.dart';
import 'package:kopichat/application/chat_data/chat_data_cubit.dart';
import 'package:kopichat/application/message/bloc/message_stream_bloc.dart';
import 'package:kopichat/application/message/cubit/message_cubit.dart';
import 'package:kopichat/application/room/room_cubit.dart';
import 'package:kopichat/injectable.dart';
import 'package:kopichat/util/chat_type_util.dart';
import 'package:kopichat/util/picker_helper.dart';
import 'package:kopichat/util/string_extension.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
  final messageBloc = getIt<MessageStreamBloc>();
  final messageCubit = getIt<MessageCubit>();
  final chatDataCubit = getIt<ChatDataCubit>();
  late type.Room room;

  void onSendPressed(dynamic message) {
    //send message
    messageCubit.sendMessage(message, room.id);
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
        lastMessages: [last],
        updatedAt: last.updatedAt,
      );
      getIt<RoomCubit>().updateRoom(newRoom);
    }
    messageBloc.close();
    super.dispose();
  }

  void _handlePreviewDataFetched(
    type.TextMessage message,
    type.PreviewData previewData,
  ) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, widget.room.id);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => chatDataCubit..setCurrentRoom(room),
        ),
        BlocProvider(
          create: (context) => messageCubit,
        ),
        BlocProvider(
            create: (context) => messageBloc..add(WatchAllMessageEvent(room))),
      ],
      child: BlocListener<MessageCubit, MessageState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            imageUploaded: (e) {
              onSendPressed(e.partialImage);
            },
            videoUploaded: (e) {
              onSendPressed(e.partialVideo);
            },
            fileUploaded: (e) {
              onSendPressed(e.partialFile);
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(room.name ?? ""),
          ),
          body: BlocListener<MessageStreamBloc, MessageStreamState>(
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
            child: BlocBuilder<MessageCubit, MessageState>(
              builder: (context, msgState) {
                return BlocBuilder<MessageStreamBloc, MessageStreamState>(
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
                          videoMessageBuilder: (p0, {required messageWidth}) {
                            final videoFuture = VideoThumbnail.thumbnailData(
                              video: p0.uri,
                              imageFormat: ImageFormat.JPEG,
                              maxWidth: messageWidth,
                              quality: 25,
                            );
                            return FutureBuilder(
                              future: videoFuture,
                              builder: (context, snp) {
                                if (snp.connectionState ==
                                    ConnectionState.done) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image(image: MemoryImage(snp.data!)),
                                      const Center(
                                        child: Icon(
                                          Icons.play_circle_filled_rounded,
                                          size: 50,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              },
                            );
                          },
                          onAttachmentPressed: () {
                            onAttachmentPressed(context);
                          },
                          isAttachmentUploading: msgState.maybeMap(
                            orElse: () => false,
                            uploading: (e) => true,
                          ),
                          showUserAvatars: true,
                          onPreviewDataFetched: _handlePreviewDataFetched,

                          usePreviewData: true,
                          // videoMessageBuilder: (p0, {required messageWidth}) {
                          //   print(p0);
                          //   return const Text("VIDEO");
                          // },
                          messages: value.messages,
                          onSendPressed: onSendPressed,
                          user: currUser,
                        );
                      },
                    );
                  },
                );
              },
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    maxCrossAxisExtent: 80,
                    crossAxisSpacing: 15,
                  ),
                  children: [
                    AttachmentMenuWidget(
                      iconData: Icons.image,
                      label: "Photos",
                      onTap: () async {
                        context.router.pop();
                        final file =
                            await PickerHelper.pickFiles(FileType.image);

                        if (file != null) {
                          messageCubit.uploadImage(file, room.id);
                        }
                      },
                    ),
                    AttachmentMenuWidget(
                      iconData: Icons.ondemand_video_rounded,
                      label: "Video",
                      onTap: () async {
                        context.router.pop();
                        final file =
                            await PickerHelper.pickFiles(FileType.video);

                        if (file != null) {
                          messageCubit.uploadVideo(file, room.id);
                        }
                      },
                    ),
                    const AttachmentMenuWidget(
                      iconData: Icons.multitrack_audio_sharp,
                      label: "Audio",
                    ),
                    AttachmentMenuWidget(
                      iconData: Icons.file_copy,
                      label: "File",
                      onTap: () async {
                        context.router.pop();
                        final file = await PickerHelper.pickFiles(FileType.any,
                            extensions: ['pdf']);

                        if (file != null) {
                          messageCubit.uploadFile(file, room.id);
                        }
                      },
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
