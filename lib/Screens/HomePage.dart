import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/AddPropertyPage.dart';
import 'package:hrsmapp/Screens/ExplorePage.dart';
import 'package:hrsmapp/Screens/ProfilePage.dart';
import 'package:hrsmapp/Screens/manageAdPage.dart';
import 'package:hrsmapp/Screens/messagePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';

import 'package:hrsmapp/models/AppConstants.dart';


class HomePage extends StatefulWidget {
  static final String routeName= '/HomepageRoute';
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _SelectedIndex= 0;
final List<String> _pageTitles =[
  'Explore',
  'Add a property',
  'Manage ads ',
  'massages',
  'Profile'

];
final List <Widget> _pages = [
  ExplorePage(),
  AddPropertyPage(),
  ManageAdsPage(),
 // MassagePage(),
  ProfilePage(),
];

BottomNavigationBarItem _buildNavigationItem(int index, IconData IconData, String text){
return BottomNavigationBarItem(
    icon: Icon(IconData, color: AppConstants.NonSelectedIconColor,),
  activeIcon: Icon(IconData, color: AppConstants.SelectedIconColor,),
  title: Text(
    text,
    style: TextStyle(
      color: _SelectedIndex == index ? AppConstants.SelectedIconColor : AppConstants.NonSelectedIconColor,
    ),
  ),
);
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

     appBar: AppBar(
          title: AppBarText(text: _pageTitles[_SelectedIndex]),
       automaticallyImplyLeading: false,

     ),
     body: _pages[_SelectedIndex],
     bottomNavigationBar: BottomNavigationBar(
       onTap: (index){
           setState(() {
             _SelectedIndex = index;
           });
       },
       currentIndex: _SelectedIndex,
       type: BottomNavigationBarType.fixed,
         items: <BottomNavigationBarItem >[
              _buildNavigationItem(0, Icons.home, _pageTitles[0]),
              _buildNavigationItem(1, Icons.add_photo_alternate_outlined,_pageTitles[1]),
              _buildNavigationItem(2, Icons.edit_outlined, _pageTitles[2]),
            //  _buildNavigationItem(3, Icons.chat, _pageTitles[3]),
              _buildNavigationItem(4, Icons.person_outline, _pageTitles[4]),
         ],
     ),

    );
  }
}
