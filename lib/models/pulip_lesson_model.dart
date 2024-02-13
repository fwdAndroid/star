import 'package:cloud_firestore/cloud_firestore.dart';

class PulipLessonModel {
  String uid;
  String uuid;
  String pulipName;
  String date;
  String time;
  String subject;

  PulipLessonModel(
      {required this.uid,
      required this.uuid,
      required this.pulipName,
      required this.time,
      required this.subject,
      required this.date});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'date': date,
        'uid': uid,
        'uuid': uuid,
        'time': time,
        "subject": subject,
        "pulipName": pulipName,
      };

  ///
  static PulipLessonModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return PulipLessonModel(
        date: snapshot['date'],
        uid: snapshot['uid'],
        uuid: snapshot['uuid'],
        time: snapshot['time'],
        pulipName: snapshot['pulipName'],
        subject: snapshot['subject']);
  }
}