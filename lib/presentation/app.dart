import 'package:flutter/material.dart';
import 'package:kopichat/presentation/pages/home/home_page.dart';
import 'package:kopichat/presentation/router/kopi_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = KopiRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
