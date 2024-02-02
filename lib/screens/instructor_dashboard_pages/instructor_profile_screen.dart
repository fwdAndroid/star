import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/auth/auth.dart';
import 'package:star/utils/colors.dart';
import 'package:star/utils/image_pick.dart';

class InstructorProfileScreen extends StatefulWidget {
  const InstructorProfileScreen({super.key});

  @override
  State<InstructorProfileScreen> createState() =>
      _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: 250,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Resources',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: colorwhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: bottomColor,
                  fixedSize: Size(301, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Terms and Conditions',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: colorwhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: bottomColor,
                  fixedSize: Size(301, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: colorwhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: bottomColor,
                  fixedSize: Size(301, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/logo.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Oh No, Your are leaving',
                                  style: TextStyle(
                                    color: Color(0xFF1C1F34),
                                    fontSize: 22,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 287,
                                  child: Text(
                                    'Are you sure you want to logout',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF6C757D),
                                      fontSize: 14,
                                      fontFamily: 'Work Sans',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 51,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'No',
                                              style: TextStyle(
                                                color: Color(0xFF1C1F34),
                                                fontSize: 16,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await FirebaseAuth.instance
                                            .signOut()
                                            .then((value) => {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (builder) =>
                                                              AuthScreen()))
                                                });

                                        showSnakBar(
                                            "Logout Successfully", context);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 51,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF40B59F),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Yes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'Logout',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  color: colorwhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: bottomColor,
                  fixedSize: Size(301, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          )
        ],
      ),
    );
  }
}
