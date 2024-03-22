import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_admin_app/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_admin_app/src/routers/routes.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Pizza Admin",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router(context.read<AuthenticationBloc>()),
    );
  }
}
