import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final goingToAuth =
          state.uri.toString() == RouteNames.singUp ||
          state.uri.toString() == RouteNames.singIn;

      if (!isLoggedIn && !goingToAuth) return RouteNames.singUp;
      if (isLoggedIn && goingToAuth) return RouteNames.home;
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomePage(
            // child: child,
          ); // ⬅ Вставляет вложенные маршруты внутрь HomePage
        },
        routes: [
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
        ],
      ),
      // GoRoute(
      //   path: RouteNames.home,
      //   name: RouteNames.home,
      //   builder: (context, state) => HomePage(),
      // ),
      // GoRoute(
      //   path: RouteNames.main,
      //   name: RouteNames.main,
      //   builder: (context, state) => MainScreen(),
      // ),
      // GoRoute(
      //   path: RouteNames.search,
      //   name: RouteNames.search,
      //   builder: (context, state) => SearchScreen(),
      // ),
      // GoRoute(
      //   path: RouteNames.profile,
      //   name: RouteNames.profile,
      //   builder: (context, state) => ProfileScreen(),
      // ),
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
}

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        return MaterialApp.router(
          routerConfig: createRouter(),
          theme: MainTheme.mainTheme,
        );
      },
    );
  }
}
