import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:gokz/intro/login_signup_page.dart';
import 'package:gokz/screens/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp(new MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: new Intro(),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  IntroState createState() => new IntroState();
}

class IntroState extends State<Intro> with AfterLayoutMixin<Intro> {
  Future checkFirstSeen() async {
    await Firebase.initializeApp();
    final user = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seenn') ?? false);
    await prefs.clear();
    if (_seen) {
      if(user == null){
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginSignup()));
      }
       else{
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home())); 
       }   
          
    } else {
       await prefs.setBool('seenn', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
    
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomBar();
  }
}

