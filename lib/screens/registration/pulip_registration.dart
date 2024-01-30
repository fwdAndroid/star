import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/registration/pulip_profile_creation.dart';
import 'package:star/utils/colors.dart';

class PulipRegistration extends StatefulWidget {
  const PulipRegistration({super.key});

  @override
  State<PulipRegistration> createState() => _PulipRegistrationState();
}

class _PulipRegistrationState extends State<PulipRegistration> {
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
          "Pulip Registration",
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _clubDescriptionController,
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
                  controller: _emailController,
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
                  controller: _emailController,
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
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText:
                          'Instructor Linking PIN (ask Instructor for PIN)',
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              PulipProfileCreation()));
                                },
                                child: Text(
                                  "Next",
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
    // Uint8List ui = await pickImage(ImageSource.gallery);
    // setState(() {
    //   _file = ui;
    // });
  }
}
