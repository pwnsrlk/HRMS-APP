import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Views/listWidgets.dart';

import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/models/postingObjects.dart';

import 'EditAdPage.dart';
import 'package:hrsmapp/pokemon_detail.dart';
import 'package:hrsmapp/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/ViewPostingPage.dart';
import 'package:hrsmapp/Views/gridWidgets.dart';
import 'package:http/http.dart' as http;
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/models/data.dart';
import 'package:hrsmapp/models/postingObjects.dart';
import 'package:hrsmapp/pokemon_detail.dart';
import 'package:hrsmapp/pokemon_model.dart';
import 'dart:io';
import 'dart:async';


class ManageAdsPage extends StatefulWidget {

  ManageAdsPage({Key key}) : super(key: key);

  @override
  _ManageAdsPageState createState() => _ManageAdsPageState();
}

class _ManageAdsPageState extends State<ManageAdsPage> {

  var jsonData;
  PokemonModel pokemonModel;

  getData() async {
    final response = await http.get(Uri.parse(
        "http://35.184.125.204/api/Ad/index"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders
            .authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjg4NjhhYjJmNzJjZjhmY2Y3M2YwNTdmYjU0NmVhNWEzODBhNDFhZWE1MzdhZmRlMDM4MzM2NzdmNzEwZjI5Njk2NWMzMGU5NzllYTEzNDgiLCJpYXQiOjE2MjI3MTMzNDUsIm5iZiI6MTYyMjcxMzM0NSwiZXhwIjoxNjU0MjQ5MzQ1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.q4xYWYdjC9IeV3twPR-2yMNwMP5ko_fqLp30Xron5iVB4SkJeJOXT_c-bgQB82ODgH9qtNSBh52OuhHAgkpRRe5Rub8jsxNXO4wGlz79N_EqzgnyTfJlY-FlqcF85GzUQW1FBRfbtwdG8sTD817GwdACMJ0mKUKNnsAZsl4UhXTL6Z3Xc82t-yBLXzzorcfve4wv7K5XL5CjXBkIOLMgftbbOtjFQZI4YxYgeB1Krsgv5nQmXit0N0n-6ojS5sBlZsc1amJ9jbEKpz7-3kz3OjtY8UFUkaQkZJb-2e_h1HLuxIi25FmshCOP_sFzR0J66-AgEOxREeOAOuRDyy2HNr1TGVfrYT3EqOn4uZ2iRd4A6TWaRIJBfOmFkkQxgslWYrDRUHBOQIz4rOXu_zMZ1-GbSa2bnXRSavqs3P7JyO1GrG8RaQYrIpAaEHOcGEoQRP8bj8VL5Il1UW0-Eb-5aL493jTNgOu6ZS1_IqCJrshOiEUeHB31j8IYRONUwgnxlNUr3GQvyDbJDlMRPCtukZRde5R5YK0lgyFu3Lj7L4DuF5OPGw2ciiPLxKUUUUwpQRusLojEilAStzageVNWZ4_Dihzdv60EiCWOMNaAFFi2EszbQY2vbAsvRqiZ3bxYxXYXjp79puxcUiEKX4w6Y2jbNImE5pplxiqXucmOUeg',
      },);

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(response.body);
      pokemonModel = PokemonModel.fromJson(jsonData);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: pokemonModel == null
          ? Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white70),
          ))
          : GridView.count(

        crossAxisCount: 1,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: pokemonModel.pokemon
            .map((Pokemon pokemon) =>
            Padding(

              padding: EdgeInsets.all(40.0),
              child: Card(

                elevation: 0.0,
                color: Colors.grey,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      customBorder: CircleBorder(),

                      splashColor: Colors.black54,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditAdPage()));
                      },
                      child: Hero(
                        tag: 'https://cf.bstatic.com/images/hotel/max1024x768/112/112518658.jpg',
                        child: Image(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              'https://cf.bstatic.com/images/hotel/max1024x768/112/112518658.jpg'),
                        ),
                      ),
                    ),
                    Text(pokemon.property_category,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ))
            .toList(),
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.black54,
        ),
      ),
    );
  }
}