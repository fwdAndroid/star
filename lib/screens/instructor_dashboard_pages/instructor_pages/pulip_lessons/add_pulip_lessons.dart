import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/services/database.dart';
import 'package:star/utils/colors.dart';

class PulipLessons extends StatefulWidget {
  const PulipLessons({super.key});

  @override
  State<PulipLessons> createState() => _PulipLessonsState();
}

class _PulipLessonsState extends State<PulipLessons> {
  List<String> dropdownItems = [];
  List<String> dropdownPulip = [];
  String? selectedValue;
  String? pulip;
  TextEditingController _timeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
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
    fetchDataPupil().then((value) {
      setState(() {
        dropdownPulip = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bottomColor,
        title: Text(
          "Add Pupil Lessons",
          style: GoogleFonts.poppins(color: colorwhite),
        ),
        iconTheme: IconThemeData(color: colorwhite),
      ),
      body: Column(
        children: [
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
            child: DropdownButtonFormField<String>(
              value: pulip,
              onChanged: (value) {
                setState(() {
                  pulip = value;
                });
              },
              items: dropdownPulip.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select a Pupil',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onTap: () {
                  _selectDate();
                },
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Select Date',
                )),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onTap: () {
                  _time();
                },
                controller: _timeController,
                decoration: InputDecoration(
                  labelText: 'Select Time',
                )),
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
                              if (selectedValue!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Subject is Required")));
                              } else if (pulip!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Pulip is Required")));
                              } else if (_dateController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Date is Required")));
                              } else if (_timeController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Time is Required")));
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                await DatabaseMethods().addPulipLessons(
                                    date: _dateController.text,
                                    subject: selectedValue!,
                                    time: _timeController.text,
                                    pulipName: pulip!);
                              }
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) =>
                                          InstructorDashboard()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Lessons is Added Successfully")));
                            },
                            child: Text(
                              "Add Lessons",
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

  Future<List<String>> fetchDataPupil() async {
    List<String> S = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('pulip')
        .where("instructorUid",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    querySnapshot.docs.forEach((doc) {
      S.add(doc['username']);
    });

    return S;
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat("dd MMM yyyy").format(picked);
      });
    }
  }

  void _time() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      DateTime parsedTime =
          DateTime(2022, 1, 1, pickedTime.hour, pickedTime.minute);
      String formattedTime = DateFormat.jm().format(parsedTime);

      setState(() {
        _timeController.text = formattedTime;
      });
    } else {
      print("Time is not selected");
    }
  }
}
