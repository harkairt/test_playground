import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_playground/auth_cubit.dart';

class AuthBlocEvent {}

class AuthBlocState {
  AuthBlocState(this.authState);

  final AuthState authState;
}

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthBlocState(AuthState.UNAUTHORIZED));

  @override
  Stream<AuthBlocState> mapEventToState(AuthBlocEvent event) async* {
    yield* _login();
  }

  Stream<AuthBlocState> _login() async* {
    debugPrint('logging in');
    yield AuthBlocState(AuthState.LOGGED_IN);
  }
}
