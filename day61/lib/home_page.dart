import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: 0.5,
            strokeWidth: 10,
          ),
        ),
        const Text(
          '25:00',
          style: TextStyle(fontSize: 40),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
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
          child: CircleAvatar(
            backgroundColor: Colors.red[400],
            radius: 50,
            child: const Icon(Icons.play_arrow, size: 40),
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
