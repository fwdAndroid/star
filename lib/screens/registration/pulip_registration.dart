import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star/screens/dasboard/pulip_dashboard.dart';
import 'package:star/services/auth.dart';
import 'package:star/utils/colors.dart';
import 'package:star/utils/image_pick.dart';

class PulipRegistration extends StatefulWidget {
  const PulipRegistration({super.key});

  @override
  State<PulipRegistration> createState() => _PulipRegistrationState();
}

class _PulipRegistrationState extends State<PulipRegistration> {
  Uint8List? _file;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  bool _isLoading = false;
  String selectedUsername = '';
  String selectedUserId = '';
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
            child: Column(children: [
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
              controller: _nameController,
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passController,
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _addressController,
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
              controller: _cityController,
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
              keyboardType: TextInputType.number,
              controller: _mobileController,
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
          Text('Select Instructor'),
          Center(
            child: FutureBuilder<QuerySnapshot>(
              future:
                  FirebaseFirestore.instance.collection('instructors').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<String> usernames = snapshot.data!.docs
                      .map((doc) => doc['username'].toString())
                      .toList();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedUsername.isEmpty
                          ? usernames.first
                          : selectedUsername,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUsername = newValue!;
                          getUidFromUsername(selectedUsername);
                        });
                      },
                      items: usernames
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      hint: Text('Select a username'),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Center(child: Text('Selected Username: $selectedUsername')),
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
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () async {
                              if (_file == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Image is Required")));
                              }
                              if (_nameController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Name is Required")));
                              } else if (_emailController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Email is Required")));
                              } else if (_passController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Password is Required")));
                              } else if (_mobileController.text.isEmpty ||
                                  _cityController.text.isEmpty ||
                                  _addressController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("All Fields are required")));
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                await AuthMethods().pulipRegistration(
                                    city: _cityController.text,
                                    instructorUid: selectedUserId,
                                    email: _emailController.text,
                                    pass: _passController.text,
                                    address: _addressController.text,
                                    licenseNumber: selectedUsername,
                                    mobileNumber: _mobileController.text,
                                    username: _nameController.text,
                                    file: _file!);
                              }
                              setState(() {
                                _isLoading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Pulip is Added Successfully")));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => PulipDashboard()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            )),
                  ),
          ),
          const SizedBox(height: 10),
        ])),
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

  Future<void> getUidFromUsername(String username) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('instructors')
          .where('username', isEqualTo: username)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          selectedUserId = querySnapshot.docs.first.id;
        });
      } else {
        setState(() {
          selectedUserId = 'Username not found';
        });
      }
    } catch (e) {
      print('Error fetching UID: $e');
      setState(() {
        selectedUserId = 'Error fetching UID';
      });
    }
  }
}
