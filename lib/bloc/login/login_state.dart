part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String uid;

  LoginSuccess({required this.uid});
}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});
}

final class AuthLoading extends LoginState {}
