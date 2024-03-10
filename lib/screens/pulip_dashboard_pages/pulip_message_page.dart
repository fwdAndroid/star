import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/instructor_tab/instructor_chat_page.dart';

class PulipMessage extends StatefulWidget {
  const PulipMessage({super.key});

  @override
  State<PulipMessage> createState() => _PulipMessageState();
}

class _PulipMessageState extends State<PulipMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pulip Message'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chats")
            .where("friendId",
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
                      backgroundImage: NetworkImage(data['insturctorPhoto']),
                    ),
                    title: Text(
                      data['instructorName'],
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
                                                friendId: datas['instructorId'],
                                                friendName:
                                                    datas['instructorName'],
                                                friendPhoto:
                                                    datas['insturctorPhoto'],
                                                userId: data['friendId'],
                                                userPhoto: data['friendPhoto'],
                                                userName: data['friendName'])));
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
