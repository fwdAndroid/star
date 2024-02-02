import 'package:cloud_firestore/cloud_firestore.dart';

class InstructorModel {
  String uid;
  String email;

  String username;
  String photoURL;
  String type;

  InstructorModel(
      {required this.uid,
      required this.email,
      required this.photoURL,
      required this.type,
      required this.username});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'photoURL': photoURL,
        "type": type
      };

  ///
  static InstructorModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return InstructorModel(
        username: snapshot['username'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        photoURL: snapshot['photoURL'],
        type: snapshot['type']);
  }
}
