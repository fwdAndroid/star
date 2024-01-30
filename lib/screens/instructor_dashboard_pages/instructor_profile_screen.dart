import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/utils/colors.dart';

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
              onPressed: () {},
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
