import 'package:animation/animation_app_page.dart';
import 'package:flutter/material.dart';

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationAppPage(),
    );
  }
}
