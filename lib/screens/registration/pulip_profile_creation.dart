import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/dasboard/pulip_dashboard.dart';
import 'package:star/utils/colors.dart';

class PulipProfileCreation extends StatefulWidget {
  const PulipProfileCreation({super.key});

  @override
  State<PulipProfileCreation> createState() => _PulipProfileCreationState();
}

class _PulipProfileCreationState extends State<PulipProfileCreation> {
  TextEditingController _clubController = TextEditingController();
  TextEditingController _clubDescriptionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Setup",
          style: GoogleFonts.poppins(color: textColor),
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _clubController,
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _clubDescriptionController,
                  decoration: InputDecoration(
                      labelText: 'Post Code',
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
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
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
                      labelText: 'License Number',
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
                                              PulipDashboard()));
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
    // Uint8List ui = await pickImage(ImageSource.gallery);
    // setState(() {
    //   _file = ui;
    // });
  }
}
