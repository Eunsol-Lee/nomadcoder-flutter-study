import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_tab_page_view_model.g.dart';

@Riverpod()
class HomeTabPageViewModel extends _$HomeTabPageViewModel {
  final List<MoodModel> _initialState = [];

  @override
  FutureOr<List<MoodModel>> build() async {
    final result = await AsyncValue.guard(() async {
      return await ref.read(moodRepositoryProvider).getMoods();
    });
    result.when(
      loading: () {},
      data: (moods) {
        state = moods;
      },
      error: (error, stackTrace) {},
    );
    return _initialState;
  }

  deleteMood(String id) async {
    final result = await AsyncValue.guard(() async {
      return await ref.read(moodRepositoryProvider).deleteMoodById(id);
    });

    ref.invalidateSelf();

    // result.when(
    //   loading: () {},
    //   data: (_) => getMoods(),
    //   error: (error, stackTrace) {},
    // );
  }
}
