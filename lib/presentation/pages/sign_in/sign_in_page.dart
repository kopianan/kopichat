import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "ananalfred@gmail.com", password: "123456");
            },
            child: Text("Sign up")),
      ),
    );
  }
}
