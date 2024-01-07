import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_tab_page_view_model.g.dart';

class CreateTabPageState {
  final Status status;
  final String? errorMessage;

  CreateTabPageState._(this.status, this.errorMessage);

  factory CreateTabPageState.initial() => CreateTabPageState._(Status.initial, null);
  factory CreateTabPageState.loading() => CreateTabPageState._(Status.loading, null);
  factory CreateTabPageState.success() => CreateTabPageState._(Status.success, null);
  factory CreateTabPageState.error(String message) => CreateTabPageState._(Status.error, message);
}

enum Status { initial, loading, success, error }

@Riverpod()
class CreateTabPageViewModel extends _$CreateTabPageViewModel {
  late final MoodRepository _moodRepository;

  @override
  CreateTabPageState build() {
    _moodRepository = ref.read(moodRepositoryProvider);
    return CreateTabPageState.initial();
  }

  Future<void> post({required String text, required String emoji}) async {
    state = CreateTabPageState.loading();
    final result = await AsyncValue.guard(() async {
      await _moodRepository.addMood(text: text, emoji: emoji);
    });
    result.when(
      loading: () {},
      data: (_) => state = CreateTabPageState.success(),
      error: (error, stackTrace) {
        state = CreateTabPageState.error(error.toString());
      },
    );
  }

  void resetState() {
    state = CreateTabPageState.initial();
  }
}
