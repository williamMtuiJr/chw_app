import 'package:flutter/material.dart';

class Refer extends StatefulWidget {
  @override
  _ReferState createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  bool myvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('Refer Page'),
      ),
      body: Card(
        child: Center(
          child: Column(children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Amana'),
                      Checkbox(value: myvalue, onChanged: null)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Temeke'),
                      Checkbox(value: myvalue, onChanged: null)
                    ],
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('SUBMIT'),
            )
          ]),
        ),
      ),
    );
  }
}
