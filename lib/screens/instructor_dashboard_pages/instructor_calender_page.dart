import 'package:flutter/material.dart';

class InstructorCalender extends StatefulWidget {
  const InstructorCalender({Key? key}) : super(key: key);

  @override
  State<InstructorCalender> createState() => _InstructorCalenderState();
}

class _InstructorCalenderState extends State<InstructorCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructor Calender'),
      ),
      body: Center(),
    );
  }
}
