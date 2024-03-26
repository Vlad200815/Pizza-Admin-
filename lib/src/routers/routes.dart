import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_admin_app/src/blocs/authentication_bloc/authentication_bloc.dart';

import 'package:pizza_admin_app/src/modules/auth/views/login_screen.dart';
import 'package:pizza_admin_app/src/modules/base/views/base_screen.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/blocs/bloc/upload_picture_bloc.dart';
import 'package:pizza_admin_app/src/modules/create_pizza/views/create_pizza_screen.dart';
import 'package:pizza_admin_app/src/modules/home/views/home_screen.dart';
import 'package:pizza_admin_app/src/modules/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_admin_app/src/modules/splash/views/splash_screen.dart';
import 'package:pizza_repository/pizza_repository.dart';

final _navKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

GoRouter router(AuthenticationBloc authBloc) {
  return GoRouter(
    navigatorKey: _navKey,
    initialLocation: '/',
    redirect: (context, state) {
      if (authBloc.state.status == AuthenticationStatus.unknown) {
        return '/';
      }
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigationKey,
        builder: (context, state, child) {
          if (state.fullPath == '/login' || state.fullPath == '/') {
            return child;
          } else {
            return BlocProvider(
              create: (context) => SignInBloc(
                userRepository:
                    context.read<AuthenticationBloc>().userRepository,
              ),
              child: BaseScreen(child),
            );
            // return Container();
          }
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => BlocProvider<AuthenticationBloc>.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child: BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const SplashScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => BlocProvider<AuthenticationBloc>.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child: BlocProvider(
                create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: LoginScreen(),
              ),
            ),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => BlocProvider<AuthenticationBloc>.value(
              value: BlocProvider.of<AuthenticationBloc>(context),
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: "/create",
            builder: (context, state) => BlocProvider(
              create: (context) => UploadPictureBloc(FirebasePizzaRepo()),
              child: const CreatePizzaScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
