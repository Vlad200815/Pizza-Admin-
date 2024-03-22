import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizza_admin_app/app.dart';
import 'package:pizza_admin_app/firebase_options.dart';
import 'package:pizza_admin_app/simple_bloc_observer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  setPathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseRepository()));
}
