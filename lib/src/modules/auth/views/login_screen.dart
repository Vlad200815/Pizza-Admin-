import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_admin_app/src/modules/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_admin_app/src/components/mybutton_widget.dart';
import 'package:pizza_admin_app/src/components/mytextfield_widget.dart';
import 'package:pizza_admin_app/src/modules/splash/views/splash_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void singInUser() {
      context.read<SignInBloc>().add(
            SignInUserChange(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }

    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              MyTextField(
                keyboardType: TextInputType.emailAddress,
                radius: 20,
                vertical: 10,
                horizontal: 18,
                hint: "email",
                controller: emailController,
                prefixIcon: const Icon(
                  CupertinoIcons.mail_solid,
                ),
              ),
              MyTextField(
                keyboardType: TextInputType.emailAddress,
                radius: 20,
                vertical: 10,
                horizontal: 18,
                hint: "password",
                controller: passwordController,
                prefixIcon: const Icon(
                  CupertinoIcons.lock_fill,
                ),
              ),
              const SizedBox(height: 40),
              MyButton(
                radius: 20,
                color: Theme.of(context).colorScheme.primary,
                text: 'Sign In',
                onPressed: singInUser,
              ),
              const SizedBox(height: 10),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SingInProgressState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SingInSuccessState) {
                    context.go("/");

                    return Container();
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
