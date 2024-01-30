import 'package:flutter/material.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/screens/dasboard/pulip_dashboard.dart';
import 'package:star/screens/registration/instructor_registration.dart';
import 'package:star/screens/registration/pulip_registration.dart';
import 'package:star/services/auth.dart';
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

class Tab1Screen extends StatefulWidget {
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  TextEditingController _instructorEmailController = TextEditingController();

  TextEditingController _instructorPasswordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _instructorEmailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _instructorPasswordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_instructorEmailController.text.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Email is Required")));
            } else if (_instructorPasswordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Password is Required")));
            } else {
              setState(() {
                isLoading = true;
              });
              String rse = await AuthMethods().loginUpUser(
                email: _instructorEmailController.text.trim(),
                pass: _instructorPasswordController.text,
              );

              print(rse);
              setState(() {
                isLoading = false;
              });
              if (rse == 'sucess') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => InstructorDashboard()));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(rse)));
              }
            }
          },
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Text(
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

//Pulip

class Tab2Screen extends StatefulWidget {
  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  bool _isLoading = false;
  TextEditingController _pulipEmailController = TextEditingController();

  TextEditingController _pulipPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _pulipEmailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _pulipPasswordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_pulipEmailController.text.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Email is Required")));
            } else if (_pulipPasswordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Password is Required")));
            } else {
              setState(() {
                _isLoading = true;
              });
              String rse = await AuthMethods().loginUpUser(
                email: _pulipEmailController.text.trim(),
                pass: _pulipPasswordController.text,
              );

              print(rse);
              setState(() {
                _isLoading = false;
              });
              if (rse == 'sucess') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => PulipDashboard()));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(rse)));
              }
            }
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
