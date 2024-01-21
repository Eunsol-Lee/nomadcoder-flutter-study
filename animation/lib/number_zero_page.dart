import 'package:flutter/material.dart';

class NumberZeroPage extends StatelessWidget {
  const NumberZeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Zero'),
      ),
      backgroundColor: Colors.tealAccent,
      body: const Center(
        child: Text('Number Zero'),
      ),
    );
  }
}
