import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FBModule {
  @singleton
  FirebaseAuth get getFirebaseAuth => FirebaseAuth.instance;

  @singleton
  GoogleSignIn get getGoogleSignin => GoogleSignIn(); 
}
