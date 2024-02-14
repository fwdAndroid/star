import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/auth/auth.dart';
import 'package:star/utils/colors.dart';
import 'package:star/utils/image_pick.dart';

class PulipProfileScreen extends StatefulWidget {
  const PulipProfileScreen({super.key});

  @override
  State<PulipProfileScreen> createState() => _PulipProfileScreenState();
}

class _PulipProfileScreenState extends State<PulipProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  'Driving Routes',
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
                  'Theory Training',
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
                  'Fuel Card',
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
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Terms and Condition',
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
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
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
                                    height: 12,
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
                                    height: 12,
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
                                    height: 12,
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
                                        width: 12,
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
                                            color: bottomColor,
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
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
