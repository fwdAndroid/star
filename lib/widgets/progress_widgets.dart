import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class CustomProgressIndicator extends StatefulWidget {
  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    // Call a function to fetch progress percentage from Firestore
    fetchProgressPercentage();
  }

  // Function to fetch progress percentage from Firestore
  void fetchProgressPercentage() async {
    try {
      // Replace 'YOUR_COLLECTION' with your Firestore collection name
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reports')
          .where("pulipId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Access the first document's 'percentage' field from the query result
        double percentage = querySnapshot.docs.first['percentage'];

        // Update the state with the retrieved percentage
        setState(() {
          progress = percentage;
        });
      } else {
        print('No documents found in the collection');
      }
    } catch (e) {
      print('Error fetching progress: $e');
    }
  }

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
