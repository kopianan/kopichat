import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopichat/application/auth/auth_cubit.dart';
import 'package:kopichat/infrastructure/auth/auth_datasource.dart';
import 'package:kopichat/injectable.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  SignInPage({super.key});


  final authCubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authCubit,
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              authCubit.signInUser("ananalfred@gmail.com", "123456");
            },
            child: Text("Sign in"),
          ),
        ),
      ),
    );
  }
}
