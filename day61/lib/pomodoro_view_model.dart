import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

enum PomodoroState {
  ready,
  running,
  paused,
  finished,
}

class PomodoroViewModel {
  final _pomodoroDuration = 1500;
  PomodoroState state;
  late int _remainedSeconds;
  Timer? _timer;

  String get remainedSecondsToString =>
      '${_remainedSeconds ~/ 60}:${_remainedSeconds % 60}';

  PomodoroViewModel({
    this.state = PomodoroState.ready,
  }) {
    _remainedSeconds = _pomodoroDuration;
  }

  void startOrResume() {
    state = PomodoroState.running;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _remainedSeconds--;
      if (_remainedSeconds <= 0) {
        state = PomodoroState.finished;
        _timer?.cancel();
      }
    });
  }

  void pause() {
    state = PomodoroState.paused;
    _timer?.cancel();
  }

  void stopOrReset() {
    state = PomodoroState.ready;
    _remainedSeconds = _pomodoroDuration;
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}

@riverpod()
final pomodoroViewModel = PomodoroViewModel();
