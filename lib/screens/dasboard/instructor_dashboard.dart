import 'package:flutter/material.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_calender_page.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_home_page.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_message.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_profile_screen.dart';
import 'package:star/utils/colors.dart';

class InstructorDashboard extends StatefulWidget {
  const InstructorDashboard({super.key});

  @override
  State<InstructorDashboard> createState() => _InstructorDashboardState();
}

class _InstructorDashboardState extends State<InstructorDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    InstructorHomePage(), // Replace with your screen widgets
    InstructorCalender(),
    InstructorMessage(),
    InstructorProfileScreen()
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
            label: 'Pupils',
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
