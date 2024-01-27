import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_admin/bloc/login/login_bloc.dart';
// import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressed) {
      emit(SignupLoadingState());
      try {
        final name = event.username;
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          yield (SignupFailedState(error: 'Password cannot be less than 6'));
        }
        await Future.delayed(const Duration(seconds: 1), () {
          return (SignupSuccessState());
        });
      } catch (e) {
        yield (SignupFailedState(error: e.toString()));
      }
    } else if (event is GotoSignupPageButton) {
      yield GotoLoginPageState();
    }
  }
}
