import 'package:cloud_firestore/cloud_firestore.dart';

class PulipModel {
  String uid;
  String email;

  String username;
  String photoURL;
  String type;
  String address;
  String mobileNumber;
  String city;
  String instructorUid;
  String liceneseNumber;
  String status;

  PulipModel(
      {required this.uid,
      required this.email,
      required this.photoURL,
      required this.type,
      required this.address,
      required this.instructorUid,
      required this.city,
      required this.status,
      required this.liceneseNumber,
      required this.mobileNumber,
      required this.username});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        "city": city,
        'email': email,
        'photoURL': photoURL,
        "instructorUid": instructorUid,
        "status": status,
        "type": type,
        "mobileNumber": mobileNumber,
        "liceneseNumber": liceneseNumber,
        "address": address
      };

  ///
  static PulipModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return PulipModel(
        username: snapshot['username'],
        uid: snapshot['uid'],
        email: snapshot['email'],
        status: snapshot['status'],
        photoURL: snapshot['photoURL'],
        city: snapshot['city'],
        instructorUid: snapshot['instructorUid'],
        address: snapshot['address'],
        liceneseNumber: snapshot['liceneseNumber'],
        mobileNumber: snapshot['mobileNumber'],
        type: snapshot['type']);
  }
}
