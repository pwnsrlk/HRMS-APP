import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/CreateNewAd.dart';
import 'package:hrsmapp/Screens/PaymentSlipPage.dart';
import 'package:hrsmapp/Views/listWidgets.dart';

import 'package:hrsmapp/models/AppConstants.dart';


class AddPropertyPage extends StatefulWidget {

  AddPropertyPage({Key key}) : super(key: key);

  @override
  _AddPropertyPageState createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {


  @override
  Widget build(BuildContext context) {



    return Column(
      children:<Widget> [
        ListView.builder(
          shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index){

              return Padding(
                padding: const EdgeInsets.fromLTRB(10,50,10,0),
                child: InkResponse(
                  onTap: (){
                    Navigator.pushNamed(context, CreateNewAdPage.routeName);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:CreateAdListTile()),
                ),

              );
}),
        Padding(
          padding: const EdgeInsets.fromLTRB(25,25,25,0),
          child: OutlineButton(onPressed: (){
            Navigator.pushNamed(context, PaymentSlipPage.routeName);
          },



             shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

    ),


              child: Text('Payment',
              style: TextStyle(
               color: Colors.black,
                fontSize: 20
    ),
    ),
          ),
        )
      ],
    );


  }
}
