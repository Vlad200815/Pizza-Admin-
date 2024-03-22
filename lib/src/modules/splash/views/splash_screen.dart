import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_admin_app/src/blocs/authentication_bloc/authentication_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            context.go('/home');
            // return Container();
          } else if (state.status == AuthenticationStatus.unauthenticated) {
            context.go('/login');
            // return Container();
            // return const LoginScreen();
          } else {
            context.go("/login");
            // return Container();
          }
          return const Scaffold(
            backgroundColor: Colors.blue,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
