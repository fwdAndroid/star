import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star/screens/instructor_dashboard_pages/instructor_pages/lessons/lesson_detail.dart';
import 'package:star/utils/colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class InstructorCalender extends StatefulWidget {
  const InstructorCalender({Key? key}) : super(key: key);

  @override
  State<InstructorCalender> createState() => _InstructorCalenderState();
}

class _InstructorCalenderState extends State<InstructorCalender> {
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
        title: const Text('Instructor Calender'),
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
              dataSource: _getCalendarDataSource(),
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
                  .where("uid",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center();
                }

                List<DocumentSnapshot> eventDocs = snapshot.data!.docs;
                List<DocumentSnapshot> filteredEvents =
                    eventDocs.where((event) {
                  String eventDate = event['date'] as String;
                  String selectedDateString =
                      DateFormat('dd MMM yyyy').format(selectedDate);
                  return eventDate == selectedDateString;
                }).toList();

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      var data =
                          filteredEvents[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(
                          'Pulip Name: ${data['pulipName'].toString()}',
                          style: TextStyle(color: bottomColor),
                        ),
                        subtitle: Text(
                          'Lesson Day: ${data['subject'].toString()}',
                          style: TextStyle(color: bottomColor),
                        ),
                        // Add more fields as needed
                        trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => LessonDetail(
                                            pulipName: data['pulipName'],
                                            time: data['time'],
                                            status: data['status'],
                                            date: data['date'],
                                            subject: data['subject'],
                                          )));
                            },
                            child: Text(
                              "View",
                              style: TextStyle(color: bottomColor),
                            )),
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
    QuerySnapshot<Map<String, dynamic>> eventsSnapshot = await FirebaseFirestore
        .instance
        .collection('pulipLessons')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List<DateTime> eventDates = eventsSnapshot.docs.map((doc) {
      // Adjust date parsing based on the actual format in Firestore
      String eventDate = doc.data()['date'] as String;
      return DateFormat('dd MMM yyyy').parse(eventDate);
    }).toList();

    return eventDates;
  }

  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = [];

    for (DateTime date in eventDates) {
      appointments.add(Appointment(
        startTime: date,
        endTime: date.add(Duration(hours: 1)),
        isAllDay: true,
        color: Colors.orange,
      ));
    }

    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
