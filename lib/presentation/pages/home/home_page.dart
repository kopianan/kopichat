import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kopichat/presentation/router/kopi_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.pushRoute(SignInRoute()); 
      }),
    );
  }
}