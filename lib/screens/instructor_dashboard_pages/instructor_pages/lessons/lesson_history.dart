import 'package:flutter/material.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/current_lesson.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/past_lesson.dart';

class LessonHistory extends StatefulWidget {
  const LessonHistory({super.key});

  @override
  State<LessonHistory> createState() => _LessonHistoryState();
}

class _LessonHistoryState extends State<LessonHistory>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson History'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Current Lesson"),
            Tab(text: "Past Lesson"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [CurrentLesson(), PastLesson()],
      ),
    );
  }
}
