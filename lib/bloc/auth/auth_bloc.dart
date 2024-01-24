import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>(loginButtonFunction);
    on<Logout>(logoutFunction);
  }

  ///////////////////////////////////
  loginButtonFunction(LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        return emit(LoginFailed(error: 'Password cannot be less than 6'));
      }
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(LoginSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      return emit(LoginFailed(error: e.toString()));
    }
  }

  void logoutFunction(Logout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }
}
