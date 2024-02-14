import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PupilReport extends StatefulWidget {
  final pupilName;
  final pupilId;
  final instrutorId;

  const PupilReport({
    super.key,
    required this.instrutorId,
    required this.pupilId,
    required this.pupilName,
  });

  @override
  State<PupilReport> createState() => _PupilReportState();
}

class _PupilReportState extends State<PupilReport> {
  List<String> dropdownItems = [];
  String? selectedValue;
  double rating = 0;
  double percentage = 0;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData().then((data) {
      setState(() {
        dropdownItems = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Generate Report'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.abhayaLibre(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  child: Text(
                    widget.pupilName,
                    style: GoogleFonts.abhayaLibre(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select an Subject',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mark Pulip ${widget.pupilName} Skill Regarding This Subject:",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar.builder(
              initialRating: rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                  calculatePercentage();
                });
              },
            ),
          ),
          CircularPercentIndicator(
            radius: 60,
            lineWidth: 10,
            percent: percentage,
            center: Text(
              '${(percentage * 100).toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 16),
            ),
            progressColor: bottomColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                fixedSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              var uuid = Uuid().v4();
                              await FirebaseFirestore.instance
                                  .collection("reports")
                                  .doc(uuid)
                                  .set({
                                "pulipId": widget.pupilId,
                                "pulipName": widget.pupilName,
                                "instructorid":
                                    FirebaseAuth.instance.currentUser!.uid,
                                "subject": selectedValue,
                                "percentage": '${(percentage * 100)}%',
                                "uuid": uuid
                              });

                              setState(() {
                                _isLoading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Reports generated Successfully")));
                            },
                            child: Text(
                              "Generate Report",
                              style: TextStyle(color: Colors.white),
                            )),
                  ),
          ),
        ],
      ),
    );
  }

  //Functions
  Future<List<String>> fetchData() async {
    List<String> data = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('lessons')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    querySnapshot.docs.forEach((doc) {
      data.add(doc['subject']);
    });

    return data;
  }

  void calculatePercentage() {
    // Assuming your maximum rating is 5. Adjust accordingly if it's different.
    double maxRating = 5;

    // Calculate the percentage based on the current rating
    percentage = rating / maxRating;

    // You can adjust the value further if needed, for example, multiplying by 100.
    // percentage *= 100;
  }
}
