import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/report/pupil_report.dart';
import 'package:star/screens/instructor_dashboard_pages/skills/show_skills.dart';
import 'package:star/utils/colors.dart';

class PulipProfileInsturctor extends StatefulWidget {
  final pic;
  final mobile;
  final email;
  final address;
  final name;
  final status;
  final id;
  PulipProfileInsturctor(
      {super.key,
      required this.name,
      required this.address,
      required this.email,
      required this.status,
      required this.mobile,
      required this.pic,
      required this.id});

  @override
  State<PulipProfileInsturctor> createState() => _PulipProfileInsturctorState();
}

class _PulipProfileInsturctorState extends State<PulipProfileInsturctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pulip Profile',
          style: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.pic,
                ),
                radius: 70,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.name,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Email',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.email,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Address',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.address,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Mobile',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.mobile,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Status',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.status,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ShowSkills(
                              name: widget.name,
                            )));
              },
              child: Text(
                "Show Pulip Skills",
                style: TextStyle(color: bottomColor),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => PupilReport(
                              instrutorId:
                                  FirebaseAuth.instance.currentUser!.uid,
                              pupilName: widget.name,
                              pupilId: widget.id,
                            )));
              },
              child: Text(
                "Generate Report",
                style: TextStyle(color: bottomColor),
              ))
        ],
      ),
    );
  }
}
