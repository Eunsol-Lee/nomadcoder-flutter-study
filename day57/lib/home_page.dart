import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isNightMode = true;
  late Timer _timer;
  final _duration = const Duration(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_duration, (timer) {
      setState(() {
        _isNightMode = !_isNightMode;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isNightMode ? Colors.black : Colors.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: _isNightMode
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(150),
              ),
            ),
            AnimatedPositioned(
              duration: _duration,
              left: _isNightMode ? 280 : 0,
              child: Container(
                width: 20,
                height: 300,
                color: _isNightMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
