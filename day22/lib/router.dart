import 'package:day22/pages/index.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
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
