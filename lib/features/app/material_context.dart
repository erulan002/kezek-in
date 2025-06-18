import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kezek_in/features/profile/view/login/log_in_screen.dart';

import '../../navigation/route_names.dart';
import '../../pages/home_page.dart';
import '../home/view/home_screen.dart';
import '../profile/view/profile_screen.dart';
import '../search/view/search_screen.dart';

final _router = GoRouter(
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
      path: RouteNames.logIn,
      name: RouteNames.logIn,
      builder: (context, state) => LogInScreen(),
    ),
  ],
);

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.teal),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor: Colors.teal),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(color: Colors.teal),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }
}
