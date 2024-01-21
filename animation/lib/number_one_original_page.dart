import 'package:flutter/material.dart';

class NumberOneOriginalPage extends StatelessWidget {
  const NumberOneOriginalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number One'),
      ),
      backgroundColor: Colors.brown,
      body: const Center(
        child: Text('Number One'),
      ),
    );
  }
}
