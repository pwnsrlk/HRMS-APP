import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/models/data.dart';
import 'package:hrsmapp/models/userObjects.dart';


class ViewProfilePage extends StatefulWidget {
  static final String routeName= '/ViewProfilePageRoute';
  final Contact contact;
  ViewProfilePage({this.contact,Key key}) : super(key: key);

  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {

   User _user;

  @override
  void initState() {
   // this._user=widget.contact.createUserFromContact();
    _loadUser();
    super.initState();
  }

  void _loadUser(){
    String contactName =widget.contact.name;
    PracticeData.users.forEach((user) {
      if (user.name==contactName){
        _user = user;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: AppBarText(text:'View Profile' ),
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background-3.png'),
            fit: BoxFit.cover
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50,100,50,0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[ Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: < Widget>[
                  AutoSizeText('${_user.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                    maxLines: 2,
                  ),

                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: MediaQuery.of(context).size.width/ 9.5,
                    child: CircleAvatar(
                      backgroundImage:  _user.displayImage,
                      radius: MediaQuery.of(context).size.width/ 10,
                    ),
                  ),

                ],

              ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:25),
                  child: AutoSizeText('${_user.email}',
                    style: TextStyle(
                      fontSize: 25,
                    ),),
                )
               ],
            ),
          ),

        ),
      ),

    );
  }
}
