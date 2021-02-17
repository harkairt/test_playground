import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_playground/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            context.read<AuthBloc>().add(AuthBlocEvent());
            // context.read<AuthCubit>().login();
          },
        ),
      ),
    );
  }
}
