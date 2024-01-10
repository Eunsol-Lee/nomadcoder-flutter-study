import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          final oddReverseIndex = index >= 5 && index < 10
              ? 9 + 5 - index
              : index >= 15 && index < 20
                  ? 19 + 15 - index
                  : index;
          return AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) => Opacity(
              opacity: (_controller.value + oddReverseIndex / 25.0) % 1,
              child: Container(
                color: Colors.red,
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(30),
              ),
            ),
          );
        },
      ),
    );
  }
}
