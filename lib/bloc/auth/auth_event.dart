part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

final class Logout extends AuthEvent {}
