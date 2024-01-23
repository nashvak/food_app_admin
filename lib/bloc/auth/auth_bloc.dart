import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          return emit(LoginFailed(error: 'Password cannot be less than 6'));
        }
        await Future.delayed(Duration(seconds: 1), () {
          return emit(LoginSuccess(uid: '$email-$password'));
        });
      } catch (e) {
        return emit(LoginFailed(error: e.toString()));
      }
    });
  }
}
