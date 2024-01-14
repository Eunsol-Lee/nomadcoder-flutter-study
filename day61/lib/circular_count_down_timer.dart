import 'package:flutter/material.dart';

class CircularCountDownTimer extends CustomPainter {
  final double progress;

  const CircularCountDownTimer({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const pi = 3.1415926535897932;
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    final progressAngle = 2 * pi * progress;

    final paint2 = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      progressAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
