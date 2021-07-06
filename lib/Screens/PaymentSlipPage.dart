import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/models/AppConstants.dart';


class PaymentSlipPage extends StatefulWidget {
  static final String routeName= '/PaymentSlipPageRoute';

  PaymentSlipPage({Key key}) : super(key: key);

  @override
  _PaymentSlipPageState createState() => _PaymentSlipPageState();
}

class _PaymentSlipPageState extends State<PaymentSlipPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: (){},
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: (){},
                child: Text('Upload PaymentSlip'),
              )
            ],
          ),
          //file == null
              //? Text('No Image Selected')
              //: Image.file(file)
        ],
      ),
    );
  }

  }




