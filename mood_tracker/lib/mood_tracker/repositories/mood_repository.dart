import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mood_repository.g.dart';

class MoodRepository {
  final MoodDataSource _moodDataSource;

  MoodRepository(this._moodDataSource);

  Future<void> addMood({required String text, required String emoji}) async {
    await _moodDataSource.addMood(text: text, emoji: emoji);
  }

  Future<List<MoodModel>> getMoods() async {
    return await _moodDataSource.getMoods();
  }

  Future<void> deleteMoodById(String id) async {
    await _moodDataSource.deleteMoodById(id);
  }
}

@Riverpod()
MoodRepository moodRepository(MoodRepositoryRef ref) => MoodRepository(
      ref.watch(moodDataSourceProvider),
    );
