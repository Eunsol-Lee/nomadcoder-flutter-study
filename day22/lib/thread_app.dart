import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/theme_model.dart';
import 'router.dart';

class ThreadApp extends StatelessWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Thread',
          themeMode: (context.watch<ThemeModel>().isDarkModel ? ThemeMode.dark : ThemeMode.light),
          theme: ThemeData(
            brightness: Brightness.light,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              showSelectedLabels: false,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              showSelectedLabels: false,
            ),
          ),
          routerConfig: router,
        );
      }),
    );
  }
}
