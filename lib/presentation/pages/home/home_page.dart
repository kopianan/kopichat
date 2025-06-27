import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:kopichat/application/room/room_cubit.dart';
import 'package:kopichat/injectable.dart';
import 'package:kopichat/util/chat_type_util.dart';
import '../../router/kopi_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Chats",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    child: PopupMenuButton<int>(
                      onSelected: (item) {
                        switch (item) {
                          case 0:
                            break;
                          case 1:
                            FirebaseAuth.instance.signOut().then((value) =>
                                context.router
                                    .replaceAll([const SplashRoute()]));
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                            value: 1, child: Text('Settings')),
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocProvider(
                  create: (context) => getIt<RoomCubit>()..watchAllRooms(),
                  child: BlocBuilder<RoomCubit, RoomState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () {
                          return Container();
                        },
                        success: (value) {
                          final rooms = value.rooms;
                          if (rooms.isEmpty) {
                            return const Center(
                              child: Text("Tidak ada chat"),
                            );
                          }
                          return ListView.separated(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              final singleRoom = rooms[index];
                              final lastMessage =
                                  singleRoom.lastMessages?.single;

                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black, width: 1.5)),
                                child: ListTile(
                                  onTap: () {
                                    context.router
                                        .push(ChatRoute(room: singleRoom));
                                  },
                                  subtitle:
                                      ChatTypeUtil.messageSubtitle(lastMessage),
                                  trailing: Text(
                                    ChatTypeUtil.formatIntDate(
                                        singleRoom.updatedAt),
                                  ),
                                  title: Text(singleRoom.name ?? ""),
                                  titleTextStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 23,
                                    backgroundImage:
                                        NetworkImage(singleRoom.imageUrl ?? ""),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushRoute(const FriendRoute());
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
