import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class CreateNewAdPage extends StatefulWidget {
  static final String routeName= '/CreateNewAdPageRoute';

  CreateNewAdPage({Key key}) : super(key: key);

  @override
  _CreateNewAdPageState createState() => _CreateNewAdPageState();
}

class _CreateNewAdPageState extends State<CreateNewAdPage> {





  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController property_categoryController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController districtController = new TextEditingController();
  final TextEditingController address_of_propertyController = new TextEditingController();
  final TextEditingController detailsController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController contact_noController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController roomsController = new TextEditingController();
  final TextEditingController washroomsController = new TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: AppBarText(text:'Create a new ad' ),
         actions: <Widget>[
           IconButton(
               icon: Icon(Icons.clear),
               onPressed: (){},
           ),
           IconButton(icon: Icon(Icons.save),
               onPressed: (){if (_formKey.currentState.validate()) {
                 _createAd(property_categoryController.text,locationController.text,cityController.text,districtController.text,address_of_propertyController.text,detailsController.text,emailController.text,contact_noController.text,priceController.text,roomsController.text,washroomsController.text);
               }}),
         ],
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
              children: <Widget>[
                Text('Please Enter The Following Information: ',
                    style: TextStyle( fontWeight: FontWeight.bold,
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
                            controller: property_categoryController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Property Category '),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (propertyValue) {
                              if (propertyValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: locationController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Location'),
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
                            controller: cityController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'city'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (cityValue) {
                              if (cityValue.isEmpty) {
                                return 'Please enter your district';
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
                            decoration: InputDecoration(labelText: 'district'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (districtValue) {
                              if (districtValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: address_of_propertyController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Address'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (addressValue) {
                              if (addressValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: detailsController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'Details'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (detailsValue) {
                              if (detailsValue.isEmpty) {
                                return 'Please enter your district';
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
                            decoration: InputDecoration(labelText: 'email'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (emailValue) {
                              if (emailValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: contact_noController,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(labelText: 'contact number'),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            validator: (contactValue) {
                              if (contactValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:priceController,
                                  cursorColor: Colors.black54,decoration: InputDecoration(labelText: 'Price'),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  validator: (priceValue) {
                                    if (priceValue.isEmpty) {
                                      return 'Please enter your district';
                                    }

                                    return null;
                                  },

                                ),
                              ),
                              Text('LKR/ Month'),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(controller: roomsController,
                            cursorColor: Colors.black54,
                              decoration: InputDecoration(labelText: 'number of Bedrooms'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            validator: (roomsValue) {
                              if (roomsValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: TextFormField(
                            controller: washroomsController,
                            cursorColor: Colors.black54,
                              decoration: InputDecoration(labelText: 'number of bathrooms'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            validator: (washroomsValue) {
                              if (washroomsValue.isEmpty) {
                                return 'Please enter your district';
                              }

                              return null;
                            },

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder:
                                    (context) => HomePage()
                                ),
                              );
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



                      ]
                  ),

                ),




              ],
            ),
          ),
        ),
      ),

    );
  }
  _createAd(String property_category,location,city,district,address_of_property,details,email,contact_no,price,rooms,washrooms) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'property_category': property_category,
      'location': location,
      'city': city,
      'district': district,
      'address_of_property': address_of_property,
      'details': details,
      'email': email,
      'contact_no': contact_no,
      'price': price,
      'rooms': rooms,
      'washrooms': washrooms,
    };

    var jsonResponse = null;
    final response = await http.post(Uri.parse(
        "http://35.184.125.204/api/Ad/create-ad"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjg4NjhhYjJmNzJjZjhmY2Y3M2YwNTdmYjU0NmVhNWEzODBhNDFhZWE1MzdhZmRlMDM4MzM2NzdmNzEwZjI5Njk2NWMzMGU5NzllYTEzNDgiLCJpYXQiOjE2MjI3MTMzNDUsIm5iZiI6MTYyMjcxMzM0NSwiZXhwIjoxNjU0MjQ5MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.q4xYWYdjC9IeV3twPR-2yMNwMP5ko_fqLp30Xron5iVB4SkJeJOXT_c-bgQB82ODgH9qtNSBh52OuhHAgkpRRe5Rub8jsxNXO4wGlz79N_EqzgnyTfJlY-FlqcF85GzUQW1FBRfbtwdG8sTD817GwdACMJ0mKUKNnsAZsl4UhXTL6Z3Xc82t-yBLXzzorcfve4wv7K5XL5CjXBkIOLMgftbbOtjFQZI4YxYgeB1Krsgv5nQmXit0N0n-6ojS5sBlZsc1amJ9jbEKpz7-3kz3OjtY8UFUkaQkZJb-2e_h1HLuxIi25FmshCOP_sFzR0J66-AgEOxREeOAOuRDyy2HNr1TGVfrYT3EqOn4uZ2iRd4A6TWaRIJBfOmFkkQxgslWYrDRUHBOQIz4rOXu_zMZ1-GbSa2bnXRSavqs3P7JyO1GrG8RaQYrIpAaEHOcGEoQRP8bj8VL5Il1UW0-Eb-5aL493jTNgOu6ZS1_IqCJrshOiEUeHB31j8IYRONUwgnxlNUr3GQvyDbJDlMRPCtukZRde5R5YK0lgyFu3Lj7L4DuF5OPGw2ciiPLxKUUUUwpQRusLojEilAStzageVNWZ4_Dihzdv60EiCWOMNaAFFi2EszbQY2vbAsvRqiZ3bxYxXYXjp79puxcUiEKX4w6Y2jbNImE5pplxiqXucmOUeg',
      }, );
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



