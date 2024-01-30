import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/services/auth.dart';
import 'package:star/utils/colors.dart';
import 'package:star/utils/image_pick.dart';

class InstructorRegistration extends StatefulWidget {
  const InstructorRegistration({super.key});

  @override
  State<InstructorRegistration> createState() => _InstructorRegistrationState();
}

class _InstructorRegistrationState extends State<InstructorRegistration> {
  Uint8List? _file;
  TextEditingController _fullName = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instructor Registration",
          style: GoogleFonts.poppins(color: textColor),
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _selectImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _file != null
                          ? CircleAvatar(
                              radius: 59, backgroundImage: MemoryImage(_file!))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/add.png",
                                width: 20,
                                height: 120,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _fullName,
                  decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: textColor,
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                    fixedSize: Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () async {
                                  if (_fullName.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Name is Required")));
                                  } else if (_emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Email is Required")));
                                  } else if (_passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Password is Required")));
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await AuthMethods().instructorRegistration(
                                        email: _emailController.text,
                                        pass: _passwordController.text,
                                        username: _fullName.text,
                                        file: _file!);
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              InstructorDashboard()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Registration Complete")));
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                )),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Functions
  /// Select Image From Gallery
  _selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _file = ui;
    });
  }
}
