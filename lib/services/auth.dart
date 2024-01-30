import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:star/models/instructor_model.dart';
import 'package:star/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Get Users Details

  //Register User with Add User
  Future<String> instructorRegistration(
      {required String email,
      required String pass,
      required String username,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty | username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal
        InstructorModel instructorModel = InstructorModel(
            username: username,
            uid: cred.user!.uid,
            email: email,
            photoURL: photoURL);
        await firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(instructorModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  ///Login User with Add Useer
  Future<String> loginUpUser({
    required String email,
    required String pass,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

        res = 'sucess';
      }
    } on FirebaseException catch (e) {
      if (e == 'WrongEmail') {
        print(e.message);
      }
      if (e == 'WrongPassword') {
        print(e.message);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
