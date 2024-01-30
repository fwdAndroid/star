import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_chat_page.dart';
import 'package:star/utils/colors.dart';

class InstructorInbox extends StatefulWidget {
  const InstructorInbox({super.key});

  @override
  State<InstructorInbox> createState() => _InstructorInboxState();
}

class _InstructorInboxState extends State<InstructorInbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
            leading: Image.asset("assets/r.png"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => InstructorChatPage(
                      // paitientid: clubData['userId'],
                      // paitientname: clubData['user_name'],
                      // doctorId: clubData['clubId'],
                      // doctorName: clubData['clubName'],
                      ),
                ),
              );
            },
            trailing: Text(
              'just now',
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            title: SizedBox(
              child: Text(
                'Laurence',
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            subtitle: SizedBox(
              child: Text(
                'Lorem Ipsum Dolor',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ));
      }),
    );
  }
}
