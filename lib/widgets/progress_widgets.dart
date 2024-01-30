import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomProgressPainter extends CustomPainter {
  final double progress;

  CustomProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10;
    final double radius = (size.width - strokeWidth) / 2;
    final double sweepAngle = 2 * pi * progress;

    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    final Paint progressPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class CustomProgressIndicator extends StatelessWidget {
  final double progress;

  CustomProgressIndicator({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: CustomProgressPainter(progress: progress),
        child: Center(
          child: Text(
            '${(progress * 100).toInt()}%',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
