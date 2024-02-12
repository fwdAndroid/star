import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/add_lessons.dart';
import 'package:star/utils/colors.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: bottomColor,
          child: Icon(
            Icons.add,
            color: colorwhite,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => AddLessons()));
          }),
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        centerTitle: true,
        title: Text(
          'Lessons',
          style: GoogleFonts.acme(
            color: colorwhite,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
