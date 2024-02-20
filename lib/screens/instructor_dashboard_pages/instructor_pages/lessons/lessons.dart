import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/add_lessons.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/edit_lesson.dart';
import 'package:star/utils/colors.dart';
import 'package:star/utils/image_pick.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
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
                context, MaterialPageRoute(builder: (builder) => AddLessons()));
          }),
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        centerTitle: true,
        title: Text(
          'Skills Set',
          style: GoogleFonts.acme(
            color: colorwhite,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: StreamBuilder(
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
                "No Skills Found Yet",
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
              final List<Map<String, dynamic>> skillsList =
                  List<Map<String, dynamic>>.from(data['skills']);
              return Column(
                children: [
                  for (int i = 1; i < skillsList.length; i++)
                    ListTile(
                      leading: Text(
                        'Pulip Name: ${data['pulipName'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      title: Text(
                        'Skill Name: ${skillsList[i]['name'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      // ... other fields ...
                      subtitle: Text(
                        'Skill Rate: ${skillsList[i]['rating'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20.0)), //this right here
                                  child: Container(
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/logo.png",
                                            height: 80,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Oh No, Do you want to Delete the Lessons',
                                            style: TextStyle(
                                              color: Color(0xFF1C1F34),
                                              fontSize: 22,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 287,
                                            child: Text(
                                              'Are you sure you want to delete',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF6C757D),
                                                fontSize: 14,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w500,
                                                height: 0.10,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 51,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 16),
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'No',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF1C1F34),
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lessons")
                                                      .doc(data['uuid'])
                                                      .delete()
                                                      .then((value) => {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (builder) =>
                                                                            InstructorDashboard())),
                                                            showSnakBar(
                                                                "Delete Successfully",
                                                                context)
                                                          });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 51,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 16),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFF40B59F),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'Work Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: colorDelete,
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
    );
  }

  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance
        .collection("lessons")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
