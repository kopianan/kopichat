import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopichat/application/room/room_cubit.dart';
import 'package:kopichat/presentation/router/kopi_router.dart';
import '../../../application/friend/friend_cubit.dart';
import '../../../injectable.dart';

@RoutePage()
class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FriendCubit>()..streamAllFriends(),
        ),
        BlocProvider(
          create: (context) => getIt<RoomCubit>(),
        ),
      ],
      child: BlocListener<RoomCubit, RoomState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            loading: (e) {},
            onRoomCreated: (resp) {
              context.router.popAndPush(ChatRoute(room: resp.room));
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Friend List"),
          ),
          body: BlocBuilder<FriendCubit, FriendState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return Container();
                },
                loading: (e) {
                  return Center(child: CircularProgressIndicator());
                },
                success: (e) {
                  final users = e.users;
                  return BlocBuilder<RoomCubit, RoomState>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final singleUser = users[index];
                          return ListTile(
                            onTap: () {
                              //create room
                              context
                                  .read<RoomCubit>()
                                  .createSingleRoom(singleUser);
                            },
                            title: Text(singleUser.firstName ?? ""),
                            leading: CircleAvatar(
                              backgroundColor: Colors.amber,
                              backgroundImage:
                                  NetworkImage(singleUser.imageUrl ?? ""),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
