import 'package:flutter/material.dart';
import 'package:hrsmapp/models/AdsModel.dart';

class AdsDetail extends StatefulWidget {
  Ads ads;
  AdsDetail(this.ads);

  @override
  _AdsDetailState createState() => _AdsDetailState(this.ads);
}

class _AdsDetailState extends State<AdsDetail> {
  Ads ads;
  _AdsDetailState(this.ads);

  @override
  Widget build(BuildContext context) {

  }
}