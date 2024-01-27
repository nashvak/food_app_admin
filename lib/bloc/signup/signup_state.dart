part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupFailedState extends SignupState {
  final String error;

  SignupFailedState({required this.error});
}

final class SignupLoadingState extends SignupState {}

class GotoLoginPageState extends SignupState {}
