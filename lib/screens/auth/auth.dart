import 'package:flutter/material.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/screens/dasboard/pulip_dashboard.dart';
import 'package:star/screens/registration/instructor_registration.dart';
import 'package:star/screens/registration/pulip_registration.dart';
import 'package:star/utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Set the number of tabs
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: backColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Card(
                elevation: 0,
                color: colorwhite,
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TabBar(
                    unselectedLabelColor: unselectedLabel,
                    labelColor: textColor,
                    tabs: [
                      Tab(text: 'Instructor'),
                      Tab(text: 'Pupil'),
                      // Add more tabs as needed
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  color: colorwhite,
                  child: TabBarView(
                    children: [
                      Tab1Screen(), // Class for Tab 1
                      Tab2Screen(), // Class for Tab 2
                      // Add more screens as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Email"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Password"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => InstructorDashboard()));
          },
          child: Text(
            "Sign In",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: Size(301, 45)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => InstructorRegistration()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Click here to register an account",
              style: TextStyle(color: unselectedLabel),
            ),
          ),
        ),
      ],
    );
  }
}

class Tab2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Email"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(hintText: "Password"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => PulipDashboard()));
          },
          child: Text(
            "Sign In",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: Size(301, 45)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => PulipRegistration()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Click here to register an account",
              style: TextStyle(color: unselectedLabel),
            ),
          ),
        ),
      ],
    );
  }
}
