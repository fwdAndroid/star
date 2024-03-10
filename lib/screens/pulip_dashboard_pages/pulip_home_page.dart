import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/pulip_dashboard_pages/pupil_lesson/pupil_lesson_detail.dart';
import 'package:star/screens/pulip_dashboard_pages/pupil_lesson/seee_all_lessons.dart';
import 'package:star/utils/colors.dart';

class PulipHomePage extends StatefulWidget {
  const PulipHomePage({super.key});

  @override
  State<PulipHomePage> createState() => _PulipHomePageState();
}

class _PulipHomePageState extends State<PulipHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("pulip")
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
                    'Pulip Name',
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("pulip")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return new CircularProgressIndicator();
            }
            var document = snapshot.data;
            return Column(
              children: [
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => SeeAllLessons()));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.montserrat(
                            color: Color(0xFFABABAB),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                                  'Instructor Name: ${data['instructorName'].toString()}',
                                  style: TextStyle(color: bottomColor),
                                ),

                                // Add more fields as needed
                                trailing: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  LessonDetailPupil(
                                                    uuid: data['uuid'],
                                                    instructorName:
                                                        data['instructorName'],
                                                    time: data['time'],
                                                    date: data['date'],
                                                    status: data['status'],
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
                  child: SizedBox(
                    height: 25,
                    child: Text(
                      'Learning Progress',
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF2D394E),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("lessons")
                        .where("pulipName", isEqualTo: document['username'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Text(
                            "No Skills Rating Found Yet",
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
                          final List<Map<String, dynamic>> skillsList =
                              List<Map<String, dynamic>>.from(data['skills']);
                          return Column(
                            children: [
                              for (int i = 0; i < skillsList.length; i++)
                                Card(
                                  child: ListTile(
                                    title: Text(
                                      'Skill Name: ${skillsList[i]['name'].toString()}',
                                      style: TextStyle(color: bottomColor),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Skill Rate: ${skillsList[i]['rating'].toString()}',
                                          style: TextStyle(color: bottomColor),
                                        ),
                                        LinearProgressIndicator(
                                          value: skillsList[i]['rating'] / 100,
                                          backgroundColor: Colors.grey,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
            );
          }),
    );
  }

  Stream<QuerySnapshot> getPulipLesson() {
    return FirebaseFirestore.instance
        .collection("pulipLessons")
        .where("status", isEqualTo: "active")
        .snapshots();
  }
}
