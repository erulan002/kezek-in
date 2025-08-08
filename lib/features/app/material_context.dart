import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/theme.dart';
import '../../navigation/auth_guard_screen.dart';
import '../../navigation/route_names.dart';
import '../../pages/nav_bar.dart';
import '../home/view/home_screen.dart';
import '../profile/view/profile_screen.dart';
import '../profile/view/sign/sign_in_screen.dart';
import '../profile/view/sign/sign_up_screen.dart';
import '../search/view/search_screen.dart';

GoRouter createRouter({required String initialLocation}) {
  return GoRouter(
    initialLocation: initialLocation,
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
        name: RouteNames.singIn,
        builder: (context, state) => const AuthGuard(child: SignInScreen()),
      ),
      GoRoute(
        path: RouteNames.singUp,
        name: RouteNames.singUp,
        builder: (context, state) => AuthGuard(child: SignUpScreen()),
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
  GoRouter? _router;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Firebase.initializeApp();

    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final initialLocation = isLoggedIn ? RouteNames.main : RouteNames.singUp;

    setState(() {
      _router = createRouter(initialLocation: initialLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_router == null) {
      return const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    return MaterialApp.router(
      routerConfig: _router!,
      theme: MainTheme.mainTheme,
    );
  }
}
