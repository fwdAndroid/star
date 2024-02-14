import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:star/screens/pulip_dashboard_pages/pupil_lesson/pupil_lesson_detail.dart';
import 'package:star/utils/colors.dart';

class SeeAllLessons extends StatefulWidget {
  const SeeAllLessons({super.key});

  @override
  State<SeeAllLessons> createState() => _SeeAllLessonsState();
}

class _SeeAllLessonsState extends State<SeeAllLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        title: Text(
          " Upcoming Lessons",
          style: TextStyle(color: colorwhite),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
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
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                final Map<String, dynamic> data =
                    documents[index].data() as Map<String, dynamic>;
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Instructor Name: ${data['instructorName'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      subtitle: Text(
                        'Subject: ${data['subject'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      // Add more fields as needed
                      trailing: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => LessonDetailPupil(
                                          uuid: data['uuid'],
                                          instructorName:
                                              data['instructorName'],
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
    );
  }

  Stream<QuerySnapshot> getPulipLesson() {
    return FirebaseFirestore.instance
        .collection("pulipLessons")
        .where("status", isEqualTo: "active")
        .snapshots();
  }
}
