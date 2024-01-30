import 'package:cloud_firestore/cloud_firestore.dart';

class InstructorModel {
  String uid;
  String email;

  String username;
  String photoURL;

  InstructorModel(
      {required this.uid,
      required this.email,
      required this.photoURL,
      required this.username});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() =>
      {'username': username, 'uid': uid, 'email': email, 'photoURL': photoURL};

  ///
  static InstructorModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return InstructorModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoURL: snapshot['photoURL'],
    );
  }
}
