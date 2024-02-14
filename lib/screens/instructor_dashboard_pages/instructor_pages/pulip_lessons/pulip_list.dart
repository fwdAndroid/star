import 'package:flutter/material.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/active_pulip.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/inactive_pulip.dart';
import 'package:star/utils/colors.dart';

class PulipList extends StatefulWidget {
  const PulipList({super.key});

  @override
  State<PulipList> createState() => _PulipListState();
}

class _PulipListState extends State<PulipList> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
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
        title: const Text('Pulip List'),
        bottom: TabBar(
          labelColor: bottomColor,
          unselectedLabelColor: textColor,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Active",
            ),
            Tab(
              text: "InActive",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ActivePulip(),
          InActivePulip(),
        ],
      ),
    );
  }
}
