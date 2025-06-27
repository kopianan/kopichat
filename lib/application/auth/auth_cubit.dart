import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/auth/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authReposiotry) : super(const AuthState.initial());
  final AuthReposiotry authReposiotry;

  void signInWithGoogle() async {
    emit(const AuthState.loading());
    final result = await authReposiotry.signInWithGoogle();
    //error / success
    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => emit(AuthState.success(r)),
    );
  }

  void signInWithEmail(String email, String password) async {
    emit(const AuthState.loading());
    final result = await authReposiotry.signInWithEmailAndPassword(
        email: email, password: password);
    //error / success

    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => emit(AuthState.success(r)),
    );
  }

  void registerWithEmail(String email, String password, String name) async {
    emit(const AuthState.loading());
    final result = await authReposiotry.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    //error / success

    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => emit(AuthState.success(r)),
    );
  }

  void checkAuthentication() async {
    emit(const AuthState.loading());
    final result = await authReposiotry.authentication();
    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => (r == null)
          ? emit(const AuthState.error("Not Authenticated"))
          : emit(AuthState.success(r)),
    );
  }
}
