import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopichat/application/auth/auth_cubit.dart';
import 'package:kopichat/injectable.dart';
import 'package:kopichat/presentation/router/kopi_router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..checkAuthentication(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeMap(
            orElse: () {},
            loading: (e) {},
            error: (e) {
              Future.delayed(Duration(seconds: 3))
                  .then((value) => context.router.replaceAll([WelcomeRoute()]));
            },
            success: (e) {
              Future.delayed(Duration(seconds: 3))
                  .then((value) => context.router.replaceAll([HomeRoute()]));
            },
          );
        },
        child: Scaffold(
          body: Center(
            child: Text("Flutter Splash Page"),
          ),
        ),
      ),
    );
  }
}
