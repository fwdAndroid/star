import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/add_pupil.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lesson_detail.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lessons.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/pulip_lessons/add_pulip_lessons.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/pulip_lessons/pulip_list.dart';
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
              icon: Icon(
                Icons.play_lesson_sharp,
                color: bottomColor,
              ),
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
      body: Column(
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
          StreamBuilder<Object>(
              stream: FirebaseFirestore.instance
                  .collection("instructors")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return new CircularProgressIndicator();
                }
                var document = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Lessons',
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF2D394E),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => PulipLessons(
                                          instructorName: document['username'],
                                        )));
                          },
                          child: Text(
                            'Add Lessons',
                            style: GoogleFonts.montserrat(
                              color: Color(0xFFABABAB),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ))
                    ],
                  ),
                );
              }),
          //Show Add Pulip Lessons
          SizedBox(
            height: 200,
            child: StreamBuilder(
              stream: getPulipLesson(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "No Upcoming Lesson",
                      style: TextStyle(color: textColor),
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
                            'Pulip Name: ${data['pulipName'].toString()}',
                            style: TextStyle(color: bottomColor),
                          ),
                          subtitle: Text(
                            'Lesson Day: ${data['date'].toString()}',
                            style: TextStyle(color: bottomColor),
                          ),
                          // Add more fields as needed
                          trailing: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => LessonDetail(
                                              uuid: data['uuid'],
                                              pulipName: data['pulipName'],
                                              time: data['time'],
                                              date: data['date'],
                                              status: data['status'],
                                              subject: data['subject'],
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
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => PulipList()));
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFFABABAB),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ))
              ],
            ),
          ),
          //Show Pulips
          SizedBox(
            height: 200,
            child: StreamBuilder(
              stream: getContactsStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "No Pulips Found Yet",
                      style: TextStyle(color: textColor),
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
                                              status: data['status'],
                                              id: data['uid'],
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
    );
  }

  //Functions
  //Contact List
  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance
        .collection("pulip")
        .where("instructorUid",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  //Pulip Lesson
  Stream<QuerySnapshot> getPulipLesson() {
    return FirebaseFirestore.instance
        .collection("pulipLessons")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("status", isEqualTo: "active")
        .snapshots();
  }
}
