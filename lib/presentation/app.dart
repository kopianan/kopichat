import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';
import 'router/kopi_router.dart';

class App extends StatelessWidget {
  App({super.key});
  final router = KopiRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
    );
  }
}
