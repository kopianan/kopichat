import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopichat/application/room/room_cubit.dart';
import 'package:kopichat/injectable.dart';
import '../../router/kopi_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => context.router.replaceAll([SplashRoute()]));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<RoomCubit>()..watchAllRooms(),
        child: BlocBuilder<RoomCubit, RoomState>(
          builder: (context, state) {
            print(state); 
            return state.maybeMap(
              orElse: () {
                return Container();
              },

              success: (value) {
                final rooms = value.rooms;
                if (rooms.isEmpty) {
                  return Center(
                    child: Text("Tidak ada chat"),
                  );
                }
                return ListView.separated(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    final singleRoom = rooms[index];
                    return ListTile(
                      title: Text(singleRoom.name ?? ""),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        backgroundImage:
                            NetworkImage(singleRoom.imageUrl ?? ""),
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
        ),
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.pushRoute(FriendRoute());
      }),
    );
  }
}
