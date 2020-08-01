import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//A cheat sheet for firebase ... not particularly relevant

class FirebaseDb {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

//  bool showSpinner = false;

  //Gets Current Logged In User from Firebase (function to be put in initState)
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  //Handles Registration
  void registerNewUser(
      {String email,
      String password,
      String namedRoute,
      BuildContext context}) async {
    try {
      //Creates New Firebase User
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        //Handles What Happens After New User is created
        Navigator.pushNamed(context, namedRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  //Handles Login Authentication
  void loginAuthentication(
      {String email,
      String password,
      BuildContext context,
      String namedRoute}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, namedRoute);
      }
    } catch (e) {
      print(e);
    }
  }

  //Handles SignOut
  void signOut(BuildContext context) async {
    _auth.signOut();
    Navigator.pop(context);
  }

  //Handles Adding data
  void addData(String collectionName, String documentName) async {
    Firestore.instance
        .collection('Message')
        .document('message' + DateTime.now().microsecondsSinceEpoch.toString())
        .setData({
      'type': 'msg',
      'subject': 'sub',
      'description': 'description',
      'to': 'user1',
      'from': 'uid',
    });
  }
}
