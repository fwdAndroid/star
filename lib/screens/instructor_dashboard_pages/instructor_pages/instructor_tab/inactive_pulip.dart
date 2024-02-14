import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star/utils/colors.dart';

class InActivePulip extends StatefulWidget {
  const InActivePulip({super.key});

  @override
  State<InActivePulip> createState() => _InActivePulipState();
}

class _InActivePulipState extends State<InActivePulip> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
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
                "No InActive Pulips  Found Yet",
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
                      'Pulip Name: ${data['username'].toString()}',
                      style: TextStyle(color: bottomColor),
                    ),
                    subtitle: Text(
                      'License Number: ${data['liceneseNumber'].toString()}',
                      style: TextStyle(color: bottomColor),
                    ),
                    // Add more fields as needed
                    trailing: TextButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("pulip")
                              .doc(data['uid'])
                              .update({"status": "active"});
                        },
                        child: Text(
                          "Active",
                          style: TextStyle(color: Colors.green),
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
    );
  }

  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance
        .collection("pulip")
        .where("instructorUid",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("status", isEqualTo: "inactive")
        .snapshots();
  }
}
