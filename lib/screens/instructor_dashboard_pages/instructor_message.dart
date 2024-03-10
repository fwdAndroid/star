import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_chat_page.dart';

class InstructorMessage extends StatefulWidget {
  const InstructorMessage({super.key});

  @override
  State<InstructorMessage> createState() => _InstructorMessageState();
}

class _InstructorMessageState extends State<InstructorMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Instructor Message'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chats")
            .where("instructorId",
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            // .where("friendship", isEqualTo: "unfriend")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Pulip Found yet",
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data['friendPhoto']),
                    ),
                    title: Text(
                      data['friendName'],
                      style: GoogleFonts.abhayaLibre(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("chats")
                            .snapshots(),
                        builder: (context, snapshot) {
                          final List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          final Map<String, dynamic> datas =
                              documents[index].data() as Map<String, dynamic>;
                          return TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            InstructorChatPage(
                                                friendId: data['friendId'],
                                                friendName: data['friendName'],
                                                friendPhoto:
                                                    data['friendPhoto'],
                                                userId: datas['instructorId'],
                                                userPhoto:
                                                    datas['insturctorPhoto'],
                                                userName:
                                                    datas['instructorName'])));
                              },
                              child: Text("Chat Now"));
                        }),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
