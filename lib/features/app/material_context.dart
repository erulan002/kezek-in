import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kezek_in/features/profile/view/sign/sign_in_screen.dart';
import 'package:kezek_in/features/profile/view/sign/sign_up_screen.dart';

import '../../core/theme/theme.dart';
import '../../navigation/route_names.dart';
import '../../pages/home_page.dart';
import '../home/view/home_screen.dart';
import '../profile/view/profile_screen.dart';
import '../search/view/search_screen.dart';

class AuthNotifier extends ChangeNotifier {
  late final StreamSubscription<User?> _subscription;

  AuthNotifier() {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

GoRouter get router => GoRouter(
  refreshListenable: AuthNotifier(),
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn = state.matchedLocation == RouteNames.singUp;

    if (user == null && !loggingIn) {
      return RouteNames.singUp;
    } else if (user != null && loggingIn) {
      return RouteNames.home;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: RouteNames.main,
      name: RouteNames.main,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: RouteNames.search,
      name: RouteNames.search,
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: RouteNames.profile,
      name: RouteNames.profile,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: RouteNames.singUp,
      name: RouteNames.singUp,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: RouteNames.singIn,
      name: RouteNames.singIn,
      builder: (context, state) => SignInScreen(),
    ),
  ],
);

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, theme: MainTheme.mainTheme);
  }
}
