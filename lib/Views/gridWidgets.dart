



import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hrsmapp/models/postingObjects.dart';

class PostingGridTile extends StatefulWidget{

  final Posting posting;

  PostingGridTile ({this.posting,Key key}): super(key: key);

  @override
  _PostingGridTileState createState() => _PostingGridTileState();

}
class _PostingGridTileState extends State<PostingGridTile>{
  Posting _posting;

  @override
  void initState() {
     this._posting = widget.posting;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          AspectRatio(
            aspectRatio: 3/2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: this._posting.displayImages.first,

                  fit: BoxFit.fill,
                ),
                border: Border.all(),
              ),

            ),
          ),
          AutoSizeText(
          "${_posting.address}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          ),
          AutoSizeText(_posting.type,
          style: TextStyle(
            fontSize: 14
          ) ,
          ),
          Text('LKR ${_posting.price}/Month'),
        ],

      ),
    );
  }

}