import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      on<LoginButtonPressed>(loginButtonFunction);
      on<Logout>(logoutFunction);
    });
  }
  ///////////////////////////////////
  loginButtonFunction(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
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

  void logoutFunction(Logout event, Emitter<LoginState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(LoginInitial());
      });
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }
}
