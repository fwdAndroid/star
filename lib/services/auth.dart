import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:star/models/instructor_model.dart';
import 'package:star/models/pulip_model.dart';
import 'package:star/screens/dasboard/instructor_dashboard.dart';
import 'package:star/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Get Users Details

  //Register User with Instructor
  Future<String> instructorRegistration(
      {required String email,
      required BuildContext context,
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
            type: "Instructor",
            username: username,
            uid: cred.user!.uid,
            email: email,
            photoURL: photoURL);
        await firebaseFirestore
            .collection('instructors')
            .doc(cred.user!.uid)
            .set(instructorModel.toJson());

        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Register User with Pulip
  Future<String> pulipRegistration(
      {required String email,
      required String pass,
      required String address,
      required String city,
      required String licenseNumber,
      required String mobileNumber,
      required String username,
      required String instructorUid,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty | username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        //Add User to the database with modal
        PulipModel instructorModel = PulipModel(
            type: "Pulip",
            username: username,
            address: address,
            status: "active",
            liceneseNumber: licenseNumber,
            mobileNumber: mobileNumber,
            city: city,
            uid: cred.user!.uid,
            instructorUid: instructorUid,
            email: email,
            photoURL: photoURL);
        await firebaseFirestore
            .collection('pulip')
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
