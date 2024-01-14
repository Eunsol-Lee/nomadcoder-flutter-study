import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pomodoro_view_model.g.dart';

enum PomodoroState {
  ready,
  running,
  paused,
  finished,
}

class PomodoroViewModelState {
  final PomodoroState state;
  final int remainedSeconds;

  PomodoroViewModelState({required this.state, required this.remainedSeconds});
  String get remainedSecondsToString => '${remainedSeconds ~/ 60}:${remainedSeconds % 60}';
}

@Riverpod()
class PomodoroViewModel extends _$PomodoroViewModel {
  final _pomodoroDuration = 1500;

  Timer? _timer;

  @override
  PomodoroViewModelState build() {
    return PomodoroViewModelState(
      state: PomodoroState.ready,
      remainedSeconds: _pomodoroDuration,
    );
  }

  dispose() {
    _timer?.cancel();
  }

  void startOrResume() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (state.remainedSeconds <= 0) {
        state = PomodoroViewModelState(
          state: PomodoroState.finished,
          remainedSeconds: 0,
        );
        _timer?.cancel();
      } else {
        state = PomodoroViewModelState(
          state: PomodoroState.running,
          remainedSeconds: state.remainedSeconds - 1,
        );
      }
    });
  }

  void pause() {
    state = PomodoroViewModelState(
      state: PomodoroState.paused,
      remainedSeconds: state.remainedSeconds,
    );
    _timer?.cancel();
  }

  void stopOrReset() {
    state = PomodoroViewModelState(
      state: PomodoroState.ready,
      remainedSeconds: _pomodoroDuration,
    );

    _timer?.cancel();
  }
}
