import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_app_admin/models/user_login_model.dart';
import 'package:food_app_admin/services/login_api.dart';
// import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(loginButtonFunction);

    on<Logout>(logoutFunction);
    // on<GotoSignupPageButton>
  }
  // @override
  // Stream<LoginState> mapEventToState(
  //   LoginEvent event,
  // ) async* {
  //   if (event is LoginButtonPressed) {
  //     emit(AuthLoadingState());
  //   }
  // }

  ///////////////////////////////////
  loginButtonFunction(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(AuthLoadingState());
    await LoginApiService()
        .login(event.email, event.password)
        .then((value) => emit(LoginSuccess(user: value)));
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
}
