import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/ConversationPage.dart';
import 'package:hrsmapp/Screens/CreateNewAd.dart';
import 'package:hrsmapp/Screens/EditAdPage.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Screens/PaymentSlipPage.dart';
import 'package:hrsmapp/Screens/PersonalInfoPage.dart';
import 'package:hrsmapp/Screens/SignUpPage.dart';
import 'package:hrsmapp/Screens/ViewPostingPage.dart';
import 'package:hrsmapp/Screens/ViewProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        HomePage.routeName: (context) => HomePage(),
        PersonalInfoPage.routeName: (context) => PersonalInfoPage(),
        ViewProfilePage.routeName: (context) => ViewProfilePage(),

       // ConversationPage.routeName: (context) => ConversationPage(),
        CreateNewAdPage.routeName: (context) => CreateNewAdPage(),
        EditAdPage.routeName: (context) =>EditAdPage(),
        PaymentSlipPage.routeName: (context) =>PaymentSlipPage(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = HomePage();
    } else {
      child = LoginPage();
    }
    return Scaffold(
      body: child,
    );
  }
}