part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  final String uid;

  LoginSuccess({required this.uid});
}

final class LoginFailed extends AuthState {
  final String error;

  LoginFailed({required this.error});
}

final class AuthLoading extends AuthState {}
