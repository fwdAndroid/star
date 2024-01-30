import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/add_pupil.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/pulip_profile_instructor.dart';
import 'package:star/utils/colors.dart';

class InstructorHomePage extends StatefulWidget {
  const InstructorHomePage({super.key});

  @override
  State<InstructorHomePage> createState() => _InstructorHomePageState();
}

class _InstructorHomePageState extends State<InstructorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: bottomColor,
          child: Icon(
            Icons.add,
            color: colorwhite,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => AddPupil()));
          }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: bottomColor,
              ))
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructor Name',
              style: GoogleFonts.acme(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Zubair Khan',
              style: GoogleFonts.acme(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: fillColors,
                    filled: true,
                    labelText: 'Search',
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: fillColors,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: fillColors,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: fillColors,
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 253,
                    height: 25,
                    child: Text(
                      'Upcoming Lessons',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF2D394E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        // Display the time
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  color: bottomColor,
                                  child: Text(
                                    "7:00 AM",
                                    style: GoogleFonts.montserrat(
                                        color: colorwhite),
                                  )),
                              Container(
                                  color: bottomColor,
                                  child: Text(
                                    "  12/05/24",
                                    style: GoogleFonts.montserrat(
                                        color: colorwhite),
                                  )),
                            ],
                          ),
                        ),

                        SizedBox(width: 6),
                        Container(
                            color: bottomColor,
                            child: Text(
                              "English",
                              style: GoogleFonts.montserrat(color: colorwhite),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 253,
                    height: 25,
                    child: Text(
                      'Pulips',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF2D394E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'See All',
                    style: GoogleFonts.montserrat(
                      color: Color(0xFFABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      PulipProfileInsturctor()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150,
                                color: bottomColor,
                                alignment: AlignmentDirectional.topStart,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  " Tayyab Ali",
                                  style:
                                      GoogleFonts.montserrat(color: colorwhite),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
