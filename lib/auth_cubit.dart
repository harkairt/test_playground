import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { UNAUTHORIZED, LOGGED_IN, LOADING }

class AuthCubitState {
  AuthCubitState(this.authState);

  final AuthState authState;
}

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({
    this.authState,
  }) : super(AuthCubitState(AuthState.UNAUTHORIZED));

  final AuthState? authState;

  void login() {
    emit(AuthCubitState(AuthState.LOGGED_IN));
  }
}
