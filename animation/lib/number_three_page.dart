import 'package:flutter/material.dart';

class NumberThreePage extends StatelessWidget {
  const NumberThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Three'),
      ),
      backgroundColor: Colors.amberAccent,
      body: const Center(
        child: Text('Number Three'),
      ),
    );
  }
}
