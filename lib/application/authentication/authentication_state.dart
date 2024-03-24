part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();
  factory AuthenticationState({User? user}) = _AuthenticationState;
  factory AuthenticationState.initial() => AuthenticationState();

  String get getUserId => user?.uid ?? "";
}
