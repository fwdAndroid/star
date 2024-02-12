import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/add_pupil.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lessons.dart';
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
          TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Lessons()));
              },
              icon: Icon(Icons.play_lesson_sharp),
              label: Text(
                "Lessons",
                style: TextStyle(color: bottomColor),
              ))
        ],
        title: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("instructors")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return Column(
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
                    document['username'],
                    style: GoogleFonts.acme(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              );
            }),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.3,
              child: StreamBuilder(
                stream: getContactsStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Pulips Found Yet",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      final Map<String, dynamic> data =
                          documents[index].data() as Map<String, dynamic>;
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Pulip Name: ${data['username'].toString()}',
                              style: TextStyle(color: bottomColor),
                            ),
                            subtitle: Text(
                              'License Number: ${data['liceneseNumber'].toString()}',
                              style: TextStyle(color: bottomColor),
                            ),
                            // Add more fields as needed
                            trailing: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              PulipProfileInsturctor(
                                                name: data['username'],
                                                address: data['address'],
                                                email: data['email'],
                                                mobile: data['mobileNumber'],
                                                pic: data['photoURL'],
                                              )));
                                },
                                child: Text(
                                  "View",
                                  style: TextStyle(color: bottomColor),
                                )),
                          ),
                          Divider(
                            color: bottomColor.withOpacity(.4),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Functions
  //Contact List
  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance.collection("pulip").snapshots();
  }
}
