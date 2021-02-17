import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test_playground/auth_bloc.dart';
import 'package:test_playground/login_screen.dart';

class MockAuthBloc extends MockBloc<AuthBlocEvent, AuthBlocState> implements AuthBloc {}

Widget wrap(Widget child, AuthBloc cubit) {
  return MaterialApp(
    home: BlocProvider<AuthBloc>.value(
      value: cubit,
      child: child,
    ),
  );
}

void main() {
  late AuthBloc authBloc;

  setUp(() {
    authBloc = MockAuthBloc();
  });

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(LoginScreen(), authBloc));

    await tester.tap(find.text('Login'));
    await tester.pump();
  });
}
