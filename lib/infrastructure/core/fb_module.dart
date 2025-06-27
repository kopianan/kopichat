import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

@module
abstract class FBModule {
  @singleton
  FirebaseAuth get getFirebaseAuth => FirebaseAuth.instance;
  @singleton
  FirebaseStorage get getFirebaseStorage => FirebaseStorage.instance;

  @singleton
  GoogleSignIn get getGoogleSignin => GoogleSignIn();

  @singleton
  FirebaseChatCore get getFirebaseChatCore => FirebaseChatCore.instance;
}
