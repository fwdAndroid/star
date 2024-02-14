import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/report/report_detail.dart';
import 'package:star/utils/colors.dart';

class ReportsShow extends StatefulWidget {
  const ReportsShow({super.key});

  @override
  State<ReportsShow> createState() => _ReportsShowState();
}

class _ReportsShowState extends State<ReportsShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        title: Text(
          'Reports',
          style: GoogleFonts.acme(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
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
                  "No Reports Found Yet",
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
                        'Subject: ${data['subject'].toString()}',
                        style: TextStyle(color: bottomColor),
                      ),
                      // Add more fields as needed
                      trailing: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => ReportDetail(
                                          pName: data['pulipName'],
                                          pSubject: data['subject'],
                                          pid: data['pulipId'],
                                          idi: data['instructorid'],
                                          prat: data['percentage'],
                                          uuid: data['uuid'],
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

  //Contact List
  Stream<QuerySnapshot> getContactsStream() {
    return FirebaseFirestore.instance
        .collection("reports")
        .where("instructorid",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
