import 'package:flutter/material.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_broadcast.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_inbox.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_send.dart';
import 'package:star/utils/colors.dart';

class InstructorMessage extends StatefulWidget {
  const InstructorMessage({super.key});

  @override
  State<InstructorMessage> createState() => _InstructorMessageState();
}

class _InstructorMessageState extends State<InstructorMessage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        automaticallyImplyLeading: false,
        title: const Text('Instructor Message'),
        bottom: TabBar(
          labelColor: bottomColor,
          unselectedLabelColor: textColor,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Inbox",
            ),
            Tab(
              text: "Sent",
            ),
            Tab(
              text: "Broad Cast",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          InstructorInbox(),
          InstructorSend(),
          InstructorBroadCast()
        ],
      ),
    );
  }
}
