import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/PersonalInfoPage.dart';
import 'package:hrsmapp/Screens/ViewProfilePage.dart';
import 'package:hrsmapp/Screens/loginPage.dart';

import 'package:hrsmapp/models/AppConstants.dart';


class ProfilePage extends StatefulWidget {

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void _logout (){
    Navigator.pushNamed(context, LoginPage.routeName);
  }
  void _PersonalInfo(){
    Navigator.pushNamed(context, PersonalInfoPage.routeName);

  }


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(20,50,25,0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: < Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
            children: < Widget>[
              MaterialButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => ViewProfilePage(contact: AppConstants.currentUser.createContactFromUser(),)
                  ),
                );
              },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: MediaQuery.of(context).size.width/ 9.5,
                  child: CircleAvatar(
                    // backgroundImage:  AppConstants.currentUser.displayImage,
                    radius: MediaQuery.of(context).size.width/ 10,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //AutoSizeText(AppConstants.currentUser.name,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //         fontSize: 20
                  //   ),
                  // ),
                  // AutoSizeText(AppConstants.currentUser.email,
                  //   style: TextStyle(
                  //       fontSize: 15
                  //   ),
                  //),
                ],
              ),
            ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              MaterialButton(onPressed: _PersonalInfo,
              child: ProfilePageListTile(text: 'Personal Information',iconData: Icons.person,)
              ),
              MaterialButton(onPressed: _logout,
                  child: ProfilePageListTile(text: 'Log Out',iconData: Icons.logout,),
                color: Colors.cyan,
                height: MediaQuery.of(context).size.height/15,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
              ),


            ],
          )
        ],
      ),
    );
  }
}
class ProfilePageListTile extends StatelessWidget{

  final String text;
  final IconData iconData;

  ProfilePageListTile ( {Key key,this.text, this.iconData}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Text(this.text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal
      ),
      ),
      trailing: Icon(this.iconData,
      size: 25,
      ),
    );
  }

}
