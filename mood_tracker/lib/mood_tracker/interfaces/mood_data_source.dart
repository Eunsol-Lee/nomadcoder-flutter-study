import 'package:mood_tracker/mood_tracker/index.dart';

abstract class MoodDataSource {
  Future<void> addMood({required String text, required String emoji});

  Future<void> deleteMoodById(String id);

  Future<List<MoodModel>> getMoods();
}
