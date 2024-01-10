import 'package:day57/home_page.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationApp extends StatelessWidget {
  const ImplicitAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Implicit Animation',
      home: HomePage(),
    );
  }
}
