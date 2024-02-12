import 'package:flutter/material.dart';

class PulipCalender extends StatefulWidget {
  const PulipCalender({super.key});

  @override
  State<PulipCalender> createState() => _PulipCalenderState();
}

class _PulipCalenderState extends State<PulipCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pulip Calender'),
        ),
        body: Container());
  }
}
