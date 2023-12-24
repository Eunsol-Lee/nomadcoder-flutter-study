import 'package:day22/pages/index.dart';
import 'package:day22/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = ref.read(authenticationRepository).isLoggedIn;
      if (state.matchedLocation != LoginPage.routePath &&
          state.matchedLocation != SignupPage.routePath &&
          !isLoggedIn) {
        return LoginPage.routePath;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routePath,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: SignupPage.routeName,
        path: SignupPage.routePath,
        builder: (context, state) {
          return const SignupPage();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) {
          return const BottomNavigationPage(
            index: 0,
          );
        },
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          return const BottomNavigationPage(
            index: 1,
          );
        },
      ),
      GoRoute(
        path: '/activity',
        builder: (context, state) {
          return const BottomNavigationPage(
            index: 3,
          );
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) {
          return const BottomNavigationPage(
            index: 4,
          );
        },
      ),
    ],
  );
});
