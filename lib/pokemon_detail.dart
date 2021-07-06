import 'package:flutter/material.dart';
import 'package:hrsmapp/pokemon_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrsmapp/Screens/HomePage.dart';
import 'package:hrsmapp/Views/TextWidgets.dart';
import 'package:hrsmapp/Views/sendEmail.dart';
import 'package:hrsmapp/models/AppConstants.dart';
import 'package:hrsmapp/models/postingObjects.dart';
import 'package:hrsmapp/Screens/ViewProfilePage.dart';


class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail(this.pokemon);
  @override
  _PokemonDetailState createState() => _PokemonDetailState(this.pokemon);
}

class _PokemonDetailState extends State<PokemonDetail> {

  Pokemon pokemon;
  _PokemonDetailState(this.pokemon);

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

                  itemCount: 3,
                  itemBuilder: (context, index){
                    return Image(
                      image: NetworkImage('https://cf.bstatic.com/images/hotel/max1024x768/112/112518658.jpg'),

                      fit: BoxFit.fill,
                    );
                  }
              ),
            ),

            Padding(
              padding:  const EdgeInsets.fromLTRB(10,5,25,0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          AutoSizeText(pokemon.property_category,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 120,top: 20,bottom:8),
                            child: MaterialButton(onPressed: (){
                              Utils.openEmail(
                                toEmail:  pokemon.email,
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

                        ],
                      ),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,0,240,10),
                    child: Text('LKR ${pokemon.price}/ Month',

                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17,right: 0,bottom: 0,),
                          child: Icon(Icons.info_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,20,140,0),
                          child: AutoSizeText(pokemon.address_of_property,
                            style: TextStyle(

                            ),
                            minFontSize: 15,
                            maxFontSize: 20,
                            maxLines: 5,
                          ),
                        ),




                      ],

                    ),
                  ),
                  ListView(
                    shrinkWrap: true,


                    children: <Widget>[

                      PostingInfoTile(
                        icon: Icon(Icons.king_bed),
                        category: '${pokemon.rooms} Bedrooms',
                        categoryInfo: '${pokemon.washrooms} Bathrooms',
                      ),
                      PostingInfoTile(
                        icon: Icon(Icons.location_on_outlined),
                        category: pokemon.location,
                        categoryInfo: pokemon.district,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:10,top: 0,right: 0,bottom: 0,),
                          child: Icon(Icons.phone_callback_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,0,190,0),
                          child: AutoSizeText(pokemon.contact_no,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20

                            ),
                            minFontSize: 15,
                            maxFontSize: 20,
                            maxLines: 5,
                          ),
                        ),




                      ],

                    ),
                  ),


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