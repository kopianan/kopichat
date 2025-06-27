import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopichat/application/authentication/authentication_cubit.dart';
import '../../../application/auth/auth_cubit.dart';
import '../../../injectable.dart';
import '../../router/kopi_router.dart';

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
              Future.delayed(const Duration(seconds: 0))
                  .then((value) => context.router.replaceAll([const WelcomeRoute()]));
            },
            success: (e) {
              //set current user 
              getIt<AuthenticationCubit>().setCurrentUser(e.user); 
              Future.delayed(const Duration(seconds: 0))
                  .then((value) => context.router.replaceAll([const HomeRoute()]));
            },
          );
        },
        child: const Scaffold(
          body: Center(
            child: Text("Flutter Splash Page"),
          ),
        ),
      ),
    );
  }
}
