part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

abstract class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  // final String uid;

  // const LoginSuccess({required this.uid});
  // @override
  // List<Object?> get props => [uid];
}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});
}

final class AuthLoadingState extends LoginState {}

//
final class GotoSignupPageState extends LoginState {}

// final class SnackbarMessageState extends LoginActionState {}
