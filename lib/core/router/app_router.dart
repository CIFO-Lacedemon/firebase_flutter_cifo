import 'dart:async';

import 'package:firebase_flutter_cifo/auth/pages/profile_page.dart';
import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/country/ui/pages/country_page.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/home/pages/home_page.dart';
import 'package:firebase_flutter_cifo/start/pages/intial_page.dart';
import 'package:firebase_flutter_cifo/auth/pages/login_page.dart';
import 'package:firebase_flutter_cifo/auth/pages/register_page.dart';
import 'package:firebase_flutter_cifo/todo/ui/pages/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes { login, register, home, initial, todos, country, profile }

final useBloc = locator<StartAppCubit>();

final List<String> routesWithoutAuth = ['/', '/login', '/register'];

final List<String> routesWithAuth = [
  '/home/profile',
  '/home/country',
  '/home/todos',
];

final goRouter = GoRouter(
  refreshListenable: GoRouterRefreshStream(useBloc.stream),
  debugLogDiagnostics: true,
  redirect: (context, state) {
    if (state.uri.toString() == '/' && useBloc.state.isLoged == false) {
      return '/login';
    }
    if (state.uri.toString() == '/' && useBloc.state.isLoged == true) {
      return '/home';
    }
    if (useBloc.state.isLoged == false &&
        !routesWithoutAuth.contains(state.uri.toString())) {
      return '/login';
    } else if (useBloc.state.isLoged == true &&
        !routesWithAuth.contains(state.uri.toString())) {
      return '/home';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.initial.name,
      builder: (context, state) {
        return IntialPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: AppRoutes.login.name,
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      name: AppRoutes.register.name,
      builder: (context, state) {
        return RegisterPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return HomePage();
      },
      routes: [
        GoRoute(
          path: 'profile',
          name: AppRoutes.profile.name,
          builder: (context, state) {
            return ProfilePage();
          },
        ),
        GoRoute(
          path: 'country',
          name: AppRoutes.country.name,
          builder: (context, state) {
            return CountryPage();
          },
        ),
        GoRoute(
          path: 'todos',
          name: AppRoutes.todos.name,
          builder: (context, state) {
            return TodosPage();
          },
        ),
      ],
    ),
  ],
);

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
