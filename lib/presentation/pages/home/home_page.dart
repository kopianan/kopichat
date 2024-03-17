import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.pushRoute(FriendRoute());
      }),
    );
  }
}
