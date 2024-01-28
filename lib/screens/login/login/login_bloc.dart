import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(loginButtonFunction);
    on<GotoSignupPageButton>(gotoSignupPage);
    on<Logout>(logoutFunction);
    // on<GotoSignupPageButton>
  }
  ///////////////////////////////////
  loginButtonFunction(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(AuthLoadingState());
    try {
      // final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        return emit(LoginFailed(error: 'Password cannot be less than 6'));
      }
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(LoginSuccess());
      });
    } catch (e) {
      return emit(LoginFailed(error: e.toString()));
    }
  }

  void logoutFunction(Logout event, Emitter<LoginState> emit) async {
    emit(AuthLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(LoginInitial());
      });
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }

  FutureOr<void> gotoSignupPage(
      GotoSignupPageButton event, Emitter<LoginState> emit) {
    emit(GotoSignupPageState());
  }
}
