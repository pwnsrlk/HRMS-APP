

import 'package:flutter/material.dart';
import 'package:hrsmapp/models/userObjects.dart';

class Posting {
 String type;
 double price;
 String description;
 String address;
 String location;
 int bedRooms;
 int bathRooms;


 Contact landLord;

 List<String> imagePaths;
 List<AssetImage> displayImages;



 Posting ({this.type='',this.price=0, this.description='',this.address='',this.location='',this.landLord,this.bedRooms=0,this.bathRooms=0 }){

   this.imagePaths=[];
   this.displayImages=[];

 }
 void setImages(List<String>imagePaths){
   this.imagePaths = imagePaths;
   imagePaths.forEach((imagePath) {
     this.displayImages .add(AssetImage(imagePath));
   });
 }
}