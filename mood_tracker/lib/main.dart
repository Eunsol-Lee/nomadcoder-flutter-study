import 'package:flutter/material.dart';
import 'package:mood_tracker/mood_tracker_app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MoodTrackerApp());
}
