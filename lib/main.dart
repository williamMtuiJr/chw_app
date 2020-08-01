import 'package:flutter/material.dart';
import 'package:samchw/ui/HomePage.dart';
import 'package:samchw/ui/login_page.dart';
import 'package:samchw/ui/welcome_page.dart';
import 'refer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CHW LoginPage',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/second': (context) => WelcomePage(),
        '/third': (context) => HomePage(),
        'fourth': (context) => Refer(),
      },
    );
  }
}
