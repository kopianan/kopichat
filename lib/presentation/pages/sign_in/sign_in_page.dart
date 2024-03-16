import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final googleAccount = await GoogleSignIn().signIn();
              if (googleAccount != null) {
                final googleAuth = await googleAccount.authentication;
                final cred = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken); 
                FirebaseAuth.instance.signInWithCredential(cred);
              }
              // FirebaseAuth.instance.createUserWithEmailAndPassword(
              //     email: "ananalfred@gmail.com", password: "123456");
            },
            child: Text("Sign up")),
      ),
    );
  }
}
