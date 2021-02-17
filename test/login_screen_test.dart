import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_playground/auth_cubit.dart';
import 'package:test_playground/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthCubitState> implements AuthCubit {}

Widget wrap(Widget child, AuthCubit cubit) {
  return MaterialApp(
    home: BlocProvider<AuthCubit>.value(
      value: cubit,
      child: child,
    ),
  );
}

void main() {
  late AuthCubit authCubit;

  setUp(() {
    authCubit = MockAuthCubit();
    whenListen(
      authCubit,
      Stream.fromIterable([AuthCubitState(AuthState.UNAUTHORIZED)]),
    );
  });

  testWidgets('', (WidgetTester tester) async {
    when(authCubit).calls(#login).thenReturn();
    await tester.pumpWidget(wrap(LoginScreen(), authCubit));

    await tester.tap(find.text('Login'));
    await tester.pump();
  });
}
