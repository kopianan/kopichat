import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kopichat/domain/auth/auth_repository.dart';

@Singleton(as: AuthReposiotry)
class AuthDatasource implements AuthReposiotry {
  AuthDatasource(this.fbAuth);
  final FirebaseAuth fbAuth;

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
}
