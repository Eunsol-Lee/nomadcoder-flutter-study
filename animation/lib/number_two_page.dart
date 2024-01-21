import 'package:flutter/material.dart';

class NumberTwoPage extends StatelessWidget {
  const NumberTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Two'),
      ),
      backgroundColor: Colors.red,
      body: const Center(
        child: Text('Number Two'),
      ),
    );
  }
}
