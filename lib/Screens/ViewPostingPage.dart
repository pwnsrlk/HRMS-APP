import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/Views/sendEmail.dart';
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/models/postingObjects.dart';
import 'package:hrsmapp/Screens/ViewProfilePage.dart';


class ViewPostingPage extends StatefulWidget {
  static final String routeName= '/ ViewPostingPageRoute';
  final Posting posting;

  ViewPostingPage({this.posting,Key key}) : super(key: key);

  @override
  _ViewPostingPageState createState() => _ViewPostingPageState();
}

class _ViewPostingPageState extends State<ViewPostingPage> {


Posting _posting;

   @override
  void initState() {
    this._posting=widget.posting;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: AppBarText(text:'Posting Information' ),
      ),

      body:SingleChildScrollView(

        child: Column(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 3/2,
            child: PageView.builder(


                itemCount: _posting.displayImages.length,
                itemBuilder: (context, index){
                  AssetImage currentImage = _posting.displayImages[index];
                  return Image(
                    image: currentImage,
                    fit: BoxFit.fill,
                  );
                }
            ),
            ),
            Padding(
                padding:  const EdgeInsets.fromLTRB(25,25,25,0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        AutoSizeText(_posting.type,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 25,bottom:8),
                          child: MaterialButton(onPressed: (){
                            Utils.openEmail(
                              toEmail: AppConstants.currentUser.email,
                              subject: 'for visiting house',
                              body: 'hi can i come to your house',
                            );
                          },
                          color: Colors.redAccent,
                            height: MediaQuery.of(context).size.height/20,
                            minWidth: double.minPositive,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),

                          child: Text('send a Email',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),),
                        ),
                        Text('LKR ${_posting.price}/ Month',

                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),),
                      ],
                    ),


                      ],
                    ),

                Padding(
                  padding: const EdgeInsets.only(top: 25,bottom: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 7,bottom: 45,),
                        child: Icon(Icons.info_outline),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: AutoSizeText(_posting.description,
                        style: TextStyle(

                        ),
                        minFontSize: 15,
                          maxFontSize: 20,
                          maxLines: 5,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          MaterialButton(onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => ViewProfilePage(contact: _posting.landLord,)
                            ),
                          );
                          },
                            child: CircleAvatar(radius: MediaQuery.of(context).size.width/12,
                              foregroundColor: Colors.black,
                              child: CircleAvatar(
                                backgroundImage: _posting.landLord.displayImage,
                                radius: MediaQuery.of(context).size.width/13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(_posting.landLord.name),
                          )
                        ],
                      ),

                    ],

                  ),
                ),
                ListView(
                  shrinkWrap: true,


                  children: <Widget>[

                    PostingInfoTile(
                      icon: Icon(Icons.king_bed),
                      category: '${_posting.bedRooms} Bedrooms',
                      categoryInfo: '${_posting.bathRooms} Bathrooms',
                    ),
                    PostingInfoTile(
                      icon: Icon(Icons.location_on_outlined),
                      category: _posting.address,
                      categoryInfo: _posting.location,
                    ),
                  ],
                ),
                //Text(''),
                //Text('),
                //GridView.count(crossAxisCount: null),
                //Text('The location'),
                //Container(),


              ],
            ),
            ),

          ],
        ),
      ),

    );
  }
}
class PostingInfoTile extends StatelessWidget {

  final Icon icon;
  final String category;
  final String categoryInfo;


  PostingInfoTile({Key key ,this.icon,this.category,this.categoryInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ListTile(
     leading: icon,
       title: Text(category,
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20,
       ) ,
       ),
     subtitle: Text(categoryInfo,
       style: TextStyle(
         fontSize: 15,
       ) ,
     ),
   );
  }

}
