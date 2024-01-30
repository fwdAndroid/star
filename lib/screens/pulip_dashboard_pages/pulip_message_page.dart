import 'package:flutter/material.dart';
import 'package:star/screens/pulip_dashboard_pages/tab/pulip_inbox.dart';
import 'package:star/screens/pulip_dashboard_pages/tab/pulip_send.dart';
import 'package:star/utils/colors.dart';

class PulipMessage extends StatefulWidget {
  const PulipMessage({super.key});

  @override
  State<PulipMessage> createState() => _PulipMessageState();
}

class _PulipMessageState extends State<PulipMessage>
    with TickerProviderStateMixin {
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
        automaticallyImplyLeading: false,
        title: const Text('Pulip Message'),
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PulipInbox(),
          PulipSend(),
        ],
      ),
    );
  }
}
