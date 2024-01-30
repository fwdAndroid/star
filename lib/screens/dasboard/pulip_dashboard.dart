import 'package:flutter/material.dart';
import 'package:star/screens/pulip_dashboard_pages/pulip_calender_page.dart';
import 'package:star/screens/pulip_dashboard_pages/pulip_home_page.dart';
import 'package:star/screens/pulip_dashboard_pages/pulip_message_page.dart';
import 'package:star/screens/pulip_dashboard_pages/pulip_profile.dart';
import 'package:star/utils/colors.dart';

class PulipDashboard extends StatefulWidget {
  const PulipDashboard({super.key});

  @override
  State<PulipDashboard> createState() => _PulipDashboardState();
}

class _PulipDashboardState extends State<PulipDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PulipHomePage(), // Replace with your screen widgets
    PulipCalender(),
    PulipMessage(),
    PulipProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: colorwhite,
              size: 25,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: colorwhite,
              size: 25,
            ),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            label: "Messages",
            icon: Icon(
              Icons.bookmark,
              color: colorwhite,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Tools",
            icon: Icon(
              Icons.person,
              color: colorwhite,
              size: 25,
            ),
          ),
        ],
        unselectedLabelStyle: TextStyle(color: colorwhite.withOpacity(.8)),
        selectedLabelStyle: TextStyle(color: colorwhite),
        backgroundColor: bottomColor, // Set your desired background color here
        selectedItemColor: colorwhite, // Set the color for selected item
        unselectedItemColor:
            colorwhite.withOpacity(.8), // Set the color for unselected items
      ),
    );
  }
}
