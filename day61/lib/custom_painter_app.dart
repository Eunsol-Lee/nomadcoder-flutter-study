import 'package:day61/home_page.dart';
import 'package:flutter/material.dart';

class CustomPainterApp extends StatelessWidget {
  const CustomPainterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Painter',
      home: HomePage(),
    );
  }
}
