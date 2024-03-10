import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/utils/colors.dart';

class ShowSkills extends StatefulWidget {
  var name;
  ShowSkills({super.key, required this.name});

  @override
  State<ShowSkills> createState() => _ShowSkillsState();
}

class _ShowSkillsState extends State<ShowSkills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pulip Skills',
          style: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 15,
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
                  for (int i = 0; i < skillsList.length; i++)
                    Card(
                      child: ListTile(
                        title: Text(
                          'Skill Name: ${skillsList[i]['name'].toString()}',
                          style: TextStyle(color: bottomColor),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skill Rate: ${skillsList[i]['rating'].toString()}',
                              style: TextStyle(color: bottomColor),
                            ),
                            LinearProgressIndicator(
                              value: skillsList[i]['rating'] / 100,
                              backgroundColor: Colors.grey,
                              valueColor: AlwaysStoppedAnimation<Color>(
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
    );
  }

  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance
        .collection("lessons")
        .where("pulipName", isEqualTo: widget.name)
        .snapshots();
  }
}
