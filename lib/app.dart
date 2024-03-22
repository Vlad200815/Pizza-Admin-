import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_admin_app/app_view.dart';
import 'package:pizza_admin_app/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp(FirebaseRepository firebaseRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthenticationBloc(
        userRepository: FirebaseRepository(),
      ),
      child: const MyAppView(),
    );
  }
}
