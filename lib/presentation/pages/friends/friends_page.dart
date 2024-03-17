import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => getIt<FriendCubit>()..streamAllFriends(),
      child: Scaffold(
        appBar: AppBar(title: Text("Friend List"),),
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
                return ListView.separated(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final singleUser = users[index];
                    return ListTile(
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
        ),
      ),
    );
  }
}
