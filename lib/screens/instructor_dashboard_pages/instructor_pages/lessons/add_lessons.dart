import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lessons.dart';
import 'package:star/services/database.dart';
import 'package:star/utils/colors.dart';
import 'package:intl/intl.dart';

class AddLessons extends StatefulWidget {
  const AddLessons({super.key});

  @override
  State<AddLessons> createState() => _AddLessonsState();
}

class _AddLessonsState extends State<AddLessons> {
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: bottomColor,
        centerTitle: true,
        title: Text(
          'Add Lessons',
          style: GoogleFonts.acme(
            color: colorwhite,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                  labelText: 'Enter Subject',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      ))),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTap: () {
                _selectDate();
              },
              controller: _dateController,
              decoration: InputDecoration(
                  labelText: 'Select Date',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      ))),
            ),
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
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(
                        color: textColor,
                      ))),
            ),
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
                              if (_subjectController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Subject is Required")));
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
                                await DatabaseMethods().addLessons(
                                  date: _dateController.text,
                                  subject: _subjectController.text,
                                  time: _timeController.text,
                                );
                              }
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => Lessons()));
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
