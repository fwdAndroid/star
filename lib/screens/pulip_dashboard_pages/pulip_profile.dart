import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/utils/colors.dart';

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
