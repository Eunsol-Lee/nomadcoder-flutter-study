import 'package:flutter/material.dart';
import 'package:mood_tracker/shared/index.dart';

class MoodTrackerApp extends StatelessWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mood Tracker',
      theme: mtThemes,
      routerConfig: mtRoutes,
    );
  }
}
