import 'package:day61/circular_count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pomodoro_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          _timer(),
          const Spacer(flex: 1),
          _buttons(),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _timer() {
    final viewModel = ref.watch(pomodoroViewModelProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(painter: CircularCountDownTimer(progress: viewModel.remainedSeconds / 1500)),
        ),
        Text(
          viewModel.remainedSecondsToString,
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }

  Widget _buttons() {
    final pomodoroState = ref.watch(pomodoroViewModelProvider).state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(pomodoroViewModelProvider.notifier).stopOrReset();
          },
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 30,
            child: const Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
        ),
        const SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            if (pomodoroState == PomodoroState.ready) {
              ref.read(pomodoroViewModelProvider.notifier).startOrResume();
            } else if (pomodoroState == PomodoroState.running) {
              ref.read(pomodoroViewModelProvider.notifier).pause();
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.red[400],
            radius: 50,
            child: Icon(
                (pomodoroState == PomodoroState.ready || pomodoroState == PomodoroState.paused)
                    ? Icons.play_arrow
                    : Icons.pause_rounded,
                size: 40),
          ),
        ),
        const SizedBox(width: 30),
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 30,
            child: const Icon(Icons.stop, size: 30),
          ),
        ),
      ],
    );
  }
}
