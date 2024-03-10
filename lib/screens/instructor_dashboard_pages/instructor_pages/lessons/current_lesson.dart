import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lesson_detail.dart';
import 'package:star/utils/colors.dart';

class CurrentLesson extends StatefulWidget {
  const CurrentLesson({super.key});

  @override
  State<CurrentLesson> createState() => _CurrentLessonState();
}

class _CurrentLessonState extends State<CurrentLesson> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                        Provider.of<LessonDetailStateNotifier>(context,
                                listen: false)
                            .hideButton();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LessonDetail(
                                      uuid: data['uuid'],
                                      pulipName: data['pulipName'],
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
    );
  }
}

//Functions
Stream<QuerySnapshot> getPulipLesson() {
  return FirebaseFirestore.instance
      .collection("pulipLessons")
      .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where("status", isEqualTo: "active")
      .snapshots();
}
