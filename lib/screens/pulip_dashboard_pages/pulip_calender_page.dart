import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star/utils/colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PulipCalender extends StatefulWidget {
  const PulipCalender({super.key});

  @override
  State<PulipCalender> createState() => _PulipCalenderState();
}

class _PulipCalenderState extends State<PulipCalender> {
  DateTime selectedDate = DateTime.now();
  List<DateTime> eventDates = [];

  @override
  void initState() {
    super.initState();
    fetchEvents().then((dates) {
      setState(() {
        eventDates = dates;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Instructor Calendar'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            child: SfCalendar(
              view: CalendarView.month,
              initialDisplayDate: currentMonth,
              initialSelectedDate: selectedDate,
              selectionDecoration: BoxDecoration(
                color: bottomColor,
                shape: BoxShape.circle,
              ),
              blackoutDatesTextStyle: const TextStyle(color: Colors.white),
              todayHighlightColor: bottomColor,
              appointmentTextStyle: TextStyle(color: Colors.white),
              onTap: (CalendarTapDetails details) {
                setState(() {
                  selectedDate = details.date!;
                });
              },
            ),
          ),
          Container(
            height: 220,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pulipLessons')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center();
                }

                List<DocumentSnapshot> eventDocs = snapshot.data!.docs;
                List<DocumentSnapshot> filteredEvents =
                    eventDocs.where((event) {
                  String? eventDate = event['date'] as String?;
                  String selectedDateString =
                      DateFormat('dd MMM yyyy').format(selectedDate);

                  // Check for null or empty string before comparison
                  return eventDate != null && eventDate == selectedDateString;
                }).toList();

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      var data =
                          filteredEvents[index].data() as Map<String, dynamic>;

                      // Use null-aware operators to handle potential null values
                      String pulipName = data['pulipName']?.toString() ?? '';
                      String subject = data['subject']?.toString() ?? '';
                      String time = data['time']?.toString() ?? '';
                      String uuid = data['uuid']?.toString() ?? '';
                      String status = data['status']?.toString() ?? '';
                      String date = data['date']?.toString() ?? '';

                      return ListTile(
                        title: Text('Pulip Name: $pulipName',
                            style: TextStyle(color: bottomColor)),
                        subtitle: Text('Lesson Day: $subject',
                            style: TextStyle(color: bottomColor)),
                        // trailing: TextButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (builder) => LessonDetail(
                        //           pulipName: pulipName,
                        //           time: time,
                        //           uuid: uuid,
                        //           status: status,
                        //           date: date,
                        //           subject: subject,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child: Text("View",
                        //       style: TextStyle(color: bottomColor)),
                        // ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<DateTime>> fetchEvents() async {
    QuerySnapshot<Map<String, dynamic>> eventsSnapshot =
        await FirebaseFirestore.instance.collection('pulipLessons').get();

    List<DateTime> eventDates = eventsSnapshot.docs.map((doc) {
      String? eventDate = doc.data()['date'] as String?;
      // Adjust date parsing based on the actual format in Firestore
      return DateFormat('dd MMM yyyy').parse(eventDate ?? '');
    }).toList();

    return eventDates;
  }
}
