import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/models/AppConstants.dart';


class PersonalInfoPage extends StatefulWidget {
  static final String routeName= '/PersonalInfoPage';
  PersonalInfoPage({Key key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _mobileNumberController;
  TextEditingController _addressController;
  TextEditingController _locationController;
  TextEditingController _passwordController;


  void _SaveInfo(){
    Navigator.pushNamed(context,HomePage.routeName);
  }
 @override
  void initState() {
    _nameController =TextEditingController(text: AppConstants.currentUser.name);
    _emailController =TextEditingController(text: AppConstants.currentUser.email);
    _mobileNumberController =TextEditingController(text: AppConstants.currentUser.mobileNumber);
    _addressController =TextEditingController(text: AppConstants.currentUser.address);
    _locationController =TextEditingController(text: AppConstants.currentUser.location);
    _passwordController =TextEditingController(text: AppConstants.currentUser.password);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: AppBarText(text:'Personal Information' ),
        actions: <Widget> [
          IconButton(
              icon: Icon(Icons.save, color: Colors.white,),
              onPressed: _SaveInfo)
        ],
      ),


      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background-3.png'),
            fit: BoxFit.cover
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50,50,50,0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Form(
                  child: Column(
                      children: <Widget>[


                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                              decoration: InputDecoration(labelText: 'Name'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            controller: _nameController,
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                              decoration: InputDecoration(labelText: 'Email'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            controller: _emailController,
                            enabled: false,

                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField( decoration: InputDecoration(labelText: 'Mobile Number'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            controller: _mobileNumberController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField( decoration: InputDecoration(labelText: 'Address'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            controller: _addressController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField( decoration: InputDecoration(labelText: 'Location'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            controller: _locationController,
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField( decoration: InputDecoration(labelText: 'Password'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            controller: _passwordController,
                            enabled: false,

                          ),
                        ),



                      ]
                  ),

                ),



                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(onPressed: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width/ 4.8,
                      child: CircleAvatar(
                        backgroundImage:  AppConstants.currentUser.displayImage,
                        radius: MediaQuery.of(context).size.width/ 5,
                      ),
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
}
