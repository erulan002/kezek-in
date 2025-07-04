import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/theme.dart';
import '../../navigation/route_names.dart';
import '../../pages/home_page.dart';
import '../home/view/home_screen.dart';
import '../profile/view/profile_screen.dart';
import '../profile/view/sign/sign_in_screen.dart';
import '../profile/view/sign/sign_up_screen.dart';
import '../search/view/search_screen.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/main',
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final goingToAuth =
          state.uri.toString() == RouteNames.singUp ||
          state.uri.toString() == RouteNames.singIn;

      if (!isLoggedIn && !goingToAuth) return RouteNames.singUp;
      if (isLoggedIn && goingToAuth) return RouteNames.main;
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/main',
            name: RouteNames.main,
            builder: (context, state) => MainScreen(),
          ),
          GoRoute(
            path: '/search',
            name: RouteNames.search,
            builder: (context, state) => SearchScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: RouteNames.profile,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: RouteNames.singIn,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: RouteNames.singUp,
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );
}

class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter(); // ✅ создаем один раз
  }

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
          routerConfig: _router, // ✅ используем кэшированный экземпляр
          theme: MainTheme.mainTheme,
        );
      },
    );
  }
}
