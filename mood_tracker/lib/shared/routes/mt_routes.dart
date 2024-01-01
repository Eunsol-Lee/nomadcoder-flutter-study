import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/authentication/index.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

const _initialLocation = '/authentication/login';

final mtRoutes = GoRouter(
  initialLocation: _initialLocation,
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => _initialLocation,
    ),
    GoRoute(
      path: '/authentication',
      redirect: (BuildContext context, GoRouterState state) {
        if (state.uri.toString() == '/authentication') {
          return '/error';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: LoginPage.routePath,
          name: LoginPage.routeName,
          pageBuilder: (context, state) => NoTransitionPage(child: const LoginPage(), key: state.pageKey),
        ),
        GoRoute(
          path: SignupPage.routePath,
          name: SignupPage.routeName,
          pageBuilder: (context, state) => NoTransitionPage(child: SignupPage(), key: state.pageKey),
        ),
      ],
    ),
    ShellRoute(
      routes: [
        GoRoute(
          path: HomeTabPage.routePath,
          name: HomeTabPage.routeName,
          pageBuilder: (context, state) => NoTransitionPage(child: const HomeTabPage(), key: state.pageKey),
        ),
        GoRoute(
          path: SettingsTabPage.routePath,
          name: SettingsTabPage.routeName,
          pageBuilder: (context, state) => NoTransitionPage(child: const SettingsTabPage(), key: state.pageKey),
        ),
      ],
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: MtBottomNavigationBarPage(child: child), key: state.pageKey),
    ),
    GoRoute(
      path: ErrorPage.routePath,
      name: ErrorPage.routeName,
      pageBuilder: (context, state) => NoTransitionPage(child: const ErrorPage(), key: state.pageKey),
    ),
  ],
);
