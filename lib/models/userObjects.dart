

import 'package:flutter/material.dart';
import 'package:hrsmapp/models/messagingObjects.dart';
import 'package:hrsmapp/models/postingObjects.dart';

class Contact {
  String name;
  String imagePath;
  AssetImage displayImage;

  Contact({this.name=(''),this.imagePath=('')}){
    this.name=this.name;
    this.displayImage= AssetImage(this.imagePath);
  }
  User createUserFromContact(){
    return User(
      name: this.name,
      imagePath: this.imagePath,
    );
  }
}
class User extends Contact {
  String email;
  String password;
  String address;
  String location;
  String mobileNumber;

  //List <Conversation> conversations;
  List <Posting> myPosting;

  User({String name=(''), String imagePath=(''),
  this.email='', this.password='', this.address='', this.location='', this.mobileNumber='',
  }):

  super(name: name,imagePath: imagePath){
   // this.conversations=[];
    this.myPosting=[];
  }


  Contact createContactFromUser(){
    return Contact(
      name: this.name,
      imagePath: this.imagePath,
    );
  }
}