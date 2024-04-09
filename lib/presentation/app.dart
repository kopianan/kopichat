import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopichat/application/authentication/authentication_cubit.dart';
import 'package:kopichat/injectable.dart';
import 'pages/home/home_page.dart';
import 'router/kopi_router.dart';

class App extends StatelessWidget {
  App({super.key});
  final router = KopiRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthenticationCubit>(),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            routerConfig: router.config(),
            scrollBehavior: const CupertinoScrollBehavior(),
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                
                backgroundColor: Colors.white,
                elevation: 4,
                foregroundColor: Colors.deepPurple,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: false,
            ),
          );
        },
      ),
    );
  }
}
