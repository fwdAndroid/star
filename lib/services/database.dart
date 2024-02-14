import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:star/models/lessons_model.dart';
import 'package:star/models/pulip_lesson_model.dart';
import 'package:uuid/uuid.dart';

class DatabaseMethods {
  //Add Lessons
  Future<String> addLessons({
    required String subject,
    required String date,
    required String time,
  }) async {
    String res = 'Some error occured';
    try {
      var uuid = Uuid().v4();
      //Add User to the database with modal
      LessonsModel instructorModel = LessonsModel(
        time: time,
        uuid: uuid,
        subject: subject,
        uid: FirebaseAuth.instance.currentUser!.uid,
        date: date,
      );
      await FirebaseFirestore.instance
          .collection('lessons')
          .doc(uuid)
          .set(instructorModel.toJson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Edit Lessons
  Future<String> editLessons({
    required String subject,
    required String date,
    required String time,
  }) async {
    String res = 'Some error occured';
    try {
      var uuid = Uuid().v4();
      //Add User to the database with modal
      LessonsModel instructorModel = LessonsModel(
        time: time,
        uuid: uuid,
        subject: subject,
        uid: FirebaseAuth.instance.currentUser!.uid,
        date: date,
      );
      await FirebaseFirestore.instance
          .collection('lessons')
          .doc(uuid)
          .update(instructorModel.toJson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Add Pulip with lessons
  Future<String> addPulipLessons({
    required String subject,
    required String date,
    required String time,
    required String pulipName,
  }) async {
    String res = 'Some error occured';
    try {
      var uuid = Uuid().v4();
      //Add User to the database with modal
      PulipLessonModel instructorModel = PulipLessonModel(
        status: "active",
        time: time,
        uuid: uuid,
        pulipName: pulipName,
        subject: subject,
        uid: FirebaseAuth.instance.currentUser!.uid,
        date: date,
      );
      await FirebaseFirestore.instance
          .collection('pulipLessons')
          .doc(uuid)
          .set(instructorModel.toJson());

      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
