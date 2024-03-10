import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star/screens/pulip_dashboard_pages/history/pulip_current_lesson.dart';
import 'package:star/screens/pulip_dashboard_pages/history/pulip_past_lesson.dart';

class PulipLessonHistory extends StatefulWidget {
  const PulipLessonHistory({super.key});

  @override
  State<PulipLessonHistory> createState() => _PulipLessonHistoryState();
}

class _PulipLessonHistoryState extends State<PulipLessonHistory>
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
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("pulip")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return new CircularProgressIndicator();
          }
          var document = snapshot.data;
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
              children: [
                PulipCurrentLesson(
                  name: document['username'],
                ),
                PulipPastLessson(
                  name: document['username'],
                )
              ],
            ),
          );
        });
  }
}
