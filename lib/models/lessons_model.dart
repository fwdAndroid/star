import 'package:cloud_firestore/cloud_firestore.dart';

class LessonsModel {
  String uid;
  String uuid;

  String date;
  String time;
  String subject;

  LessonsModel(
      {required this.uid,
      required this.uuid,
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
      };

  ///
  static LessonsModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return LessonsModel(
        date: snapshot['date'],
        uid: snapshot['uid'],
        uuid: snapshot['uuid'],
        time: snapshot['time'],
        subject: snapshot['subject']);
  }
}
