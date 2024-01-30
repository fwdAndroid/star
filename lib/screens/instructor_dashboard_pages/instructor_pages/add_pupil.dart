import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/utils/colors.dart';

class AddPupil extends StatefulWidget {
  const AddPupil({super.key});

  @override
  State<AddPupil> createState() => _AddPupilState();
}

class _AddPupilState extends State<AddPupil> {
  Uint8List? _file;
  TextEditingController _clubController = TextEditingController();
  TextEditingController _clubDescriptionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Pupil",
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _clubController,
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _clubDescriptionController,
                  decoration: InputDecoration(
                      labelText: 'Address',
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'City',
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'License',
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
              const SizedBox(height: 10),
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
                                            BorderRadius.circular(12))),
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              InstructorDashboard()));
                                },
                                child: Text(
                                  "Add Pupil",
                                  style: TextStyle(color: Colors.white),
                                )),
                      ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

//Functions
  /// Select Image From Gallery
  _selectImage() async {
    // Uint8List ui = await pickImage(ImageSource.gallery);
    // setState(() {
    //   _file = ui;
    // });
  }
}
