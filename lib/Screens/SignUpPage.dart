import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class SignUpPage extends StatefulWidget {
  static final String routeName= '/signUpPageRoute';
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController mobile_noController = new TextEditingController();
  final TextEditingController districtController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: AppBarText(text: 'Sign Up Page'),
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/images/background-3.png'),
            fit: BoxFit.cover
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Please Enter The Following Information: ',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[


                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: nameController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Name'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (namevalue) {
                              if (namevalue.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: emailController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Email'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (emailValue) {
                              if (emailValue.isEmpty) {
                                return 'Please enter email';
                              }

                              return null;
                            },
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: mobile_noController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                labelText: 'Location(District)'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (mobileValue) {
                              if (mobileValue.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: districtController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                labelText: 'Password'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (locationValue) {
                              if (locationValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Mobile Number'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 3,
                            validator: (passwordValue) {
                              if (passwordValue.isEmpty) {
                                return 'Please enter mobile number';
                              }

                              return null;
                            },
                          ),
                        ),


                      ]
                  ),

                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _register(nameController.text, emailController.text,
                            mobile_noController.text,
                            districtController.text, passwordController.text);
                      }
                    },
                    child: Text(
                        'Submit', style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                    color: Colors.cyan,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 15,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }

  _register(String name, email,  district, pass ,mobile_no ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'mobile_no': mobile_no,
      'district': district,
      'password': pass,
    };

    var jsonResponse = null;
    var response = await http.post("http://35.184.125.204/register", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(json.decode(response.body));
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()), (
            Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
