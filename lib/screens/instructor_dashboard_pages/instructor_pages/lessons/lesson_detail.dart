import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/utils/colors.dart';
import 'package:provider/provider.dart';

class LessonDetail extends StatefulWidget {
  final date;
  final time;
  final pulipName;
  final status;
  final uuid;

  LessonDetail({
    super.key,
    required this.pulipName,
    required this.time,
    required this.status,
    required this.date,
    required this.uuid,
  });

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class LessonDetailStateNotifier extends ChangeNotifier {
  bool showButton = true;

  void hideButton() {
    showButton = false;
    notifyListeners();
  }

  void showButtons() {
    showButton = true;
    notifyListeners();
  }
}

class _LessonDetailState extends State<LessonDetail> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final lessonDetailState = Provider.of<LessonDetailStateNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UpComing Lesson',
          style: GoogleFonts.acme(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    widget.pulipName,
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
            child: Row(
              children: [
                Text(
                  'time',
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
                    widget.time,
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
            child: Row(
              children: [
                Text(
                  'date',
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
                    widget.date,
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
            child: Row(
              children: [
                Text(
                  'Status',
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
                    widget.status,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : lessonDetailState.showButton
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              fixedSize: Size(300, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await FirebaseFirestore.instance
                                .collection("pulipLessons")
                                .doc(widget.uuid)
                                .update({"status": "inactive"});

                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        InstructorDashboard()));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Lecture Completed")));
                          },
                          child: Text(
                            "Lecture Complete",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
