import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/auth/auth_repository.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

@Singleton(as: AuthReposiotry)
class AuthDatasource implements AuthReposiotry {
  AuthDatasource(this.fbAuth, this.googleSignIn, this.fbChatCore);
  final FirebaseAuth fbAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseChatCore fbChatCore;

  Future<void> registerUserToFirestore(User user, {String? name}) async {
    final chatUser = types.User(
      id: user.uid,
      imageUrl: user.photoURL ?? 'https://i.pravatar.cc/300',
      firstName: name ?? user.displayName,
      lastName: "",
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      role: types.Role.user,
    );
    fbChatCore.createUserInFirestore(chatUser);
  }

  @override
  Future<Either<String, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCred = await fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = userCred.user;
      if (user == null) return left("User Not Found");
      //register to Firebase Success.
      //create user on firestore
      await registerUserToFirestore(user, name: name);
      return right(user);
    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") {
        return left("Email is exist");
      } else if (err.code == "invalid-email") {
        return left("Email wrong");
      } else if (err.code == "operation-not-allowed") {
        return left("Operation not allowed");
      } else {
        return left("Operation not allowed");
      }
    } catch (e) {
      return left("Operation not allowed");
    }
  }

  @override
  Future<Either<String, User>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCred = await fbAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCred.user;
      if (user == null) return left("User Not Found");

      return right(user);
    } on FirebaseAuthException catch (err) {
      print(err);
      if (err.code == "user-disabled") {
        return left("User is disabled");
      } else if (err.code == "invalid-email") {
        return left("Email wrong");
      } else if (err.code == "user-not-found") {
        return left("No User found with this email");
      } else if (err.code == "wrong-password") {
        return left("Password is wrong");
      } else {
        return left("Operation not allowed");
      }
    } catch (e) {
      return left("Operation not allowed");
    }
  }

  @override
  Future<Either<String, User>> signInWithGoogle() async {
    if (googleSignIn.currentUser != null) await googleSignIn.signOut();

    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      //login prompt success

      final googleAuth = await googleAccount.authentication;

      final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final userCred = await fbAuth.signInWithCredential(cred);
        final user = userCred.user;
        if (user == null) {
          return left("User Not Found");
        } else {
          registerUserToFirestore(user);
          return right(user);
        }
      } on FirebaseAuthException catch (err) {
        if (err.code == "account-exists-with-different-credential") {
          return left(
              "User already registered with different provider but same email");
        } else if (err.code == "user-not-found") {
          return left("No User found with this email");
        } else if (err.code == "wrong-password") {
          return left("Password is wrong");
        } else if (err.code == "operation-not-allowed") {
          return left("Operation not allowed");
        } else {
          return left("Server Error");
        }
      }
    } else {
      return left("User Not Found");
    }
  }

  @override
  Future<Either<String, User?>> authentication() async {
    try {
      final currUser = fbAuth.currentUser;

      if (currUser != null) return right(currUser);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
