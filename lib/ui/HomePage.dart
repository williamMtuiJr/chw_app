import 'package:flutter/material.dart';
import 'package:samchw/refer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'package:uuid/uuid.dart';

final _firestore = Firestore.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullName;
  String phoneNumber;
  String age;
  String gender;
  String status;

  String _valGender;
  String _valAge;
  String _valStatus;
  List _status = ['SAM', 'MAM', 'Nourished'];
  List _listGender = ["Male", "Female"];
  List _myAge = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFf7418c),
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Region',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'District',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ward',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                DropdownButton(
                  hint: Text("Select Age"),
                  value: _valAge,
                  items: _myAge.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valAge = value;
                    });
                  },
                ),
                DropdownButton(
                  hint: Text("Select The Gender"),
                  value: _valGender,
                  items: _listGender.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valGender = value;
                    });
                  },
                ),
                DropdownButton(
                  hint: Text("Status"),
                  value: _valStatus,
                  items: _status.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _valStatus = value;
                    });
                  },
                ),
                FlatButton(
                  color: Color(0xFFf7418c),
                  //On pressed next send saved values to firestore
                  onPressed: () async {
                    var uuid = Uuid(); //Creates random id for a child
                    _firestore.collection('children').add({
                      'age': '$_valAge',
                      'gender': '$_valGender',
                      'name': fullName,
                      'status': '$_valStatus',
                      'phone_number': phoneNumber,
                      'child_id': uuid.v4(),
                    });
                    navigateToRefer(context);
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future navigateToRefer(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Refer()));
}
