


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hrsmapp/Screens/ViewProfilePage.dart';
import 'package:hrsmapp/models/postingObjects.dart';

/*class ConversationListTile extends StatefulWidget{

  ConversationListTile({Key key}): super(key: key);
  @override
  _ConversationListTileState createState() => _ConversationListTileState();
  }



class _ConversationListTileState extends State<ConversationListTile>{
  @override
  Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(''),

        fit: BoxFit.fill,
      ),
      border: Border.all(),
    ),
    child: ListTile(

      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
        radius: MediaQuery.of(context).size.width/14,
      ),
      title: Text(
        'Kasun',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        'hi.how r u',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: Text('March 22',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
       contentPadding: EdgeInsets.all(15),

    ),
  );
  }
  
}
class MessageListTile extends StatelessWidget{

  MessageListTile({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {

   /*return Padding(
     padding: const EdgeInsets.fromLTRB(15,15,15,15),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.end,
       children:<Widget> [
         GestureDetector(
           onTap: (){
             onTap: Navigator.pushNamed(context, ViewProfilePage.routeName);
           },



           child: CircleAvatar(
             backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
             radius: MediaQuery.of(context).size.width/ 20,
           ),
         ),
         Flexible(
           child: Padding(
             padding: const EdgeInsets.only(left: 10),
             child: Container(
               padding: EdgeInsets.all(15),
               decoration: BoxDecoration(
                 color: Colors.blueGrey.shade100,
                 borderRadius: BorderRadius.circular(15),
               ),
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:<Widget> [
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10),
                     child: Text('hi. how r u.this is really long message for test the working of message adcdefghifkmlnop wertyuijvchbjnklmb',
                     textWidthBasis: TextWidthBasis.parent, style: TextStyle(
                         fontSize: 20,
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.bottomRight,
                       child: Text('march 21',
                         style: TextStyle(
                           fontSize: 15,
                         ),
                       ),

                   ),


                 ],
               ),

             ),
           ),
         ),
       ],
     ),
   );*/
    return Padding(
      padding: const EdgeInsets.fromLTRB(35,15,15,15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:<Widget> [

          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('hi. how r u.this is really long message for test the working of message adcdefghifkmlnop wertyuijvchbjnklmb',
                        textWidthBasis: TextWidthBasis.parent, style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text('march 21',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                    ),


                  ],
                ),

              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              onTap: Navigator.pushNamed(context, ViewProfilePage.routeName);
            },



            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
              radius: MediaQuery.of(context).size.width/ 20,
            ),
          ),
        ],
      ),
    );
  }
  
}*/
class ManageAdsTile extends StatefulWidget {
  final Posting posting;
  ManageAdsTile({this.posting,Key key}): super(key: key);
  @override
  _ManageAdsTileState createState() => _ManageAdsTileState();

}
class _ManageAdsTileState extends State<ManageAdsTile>{

  Posting _posting;

  @override
  void initState() {
    this._posting= widget.posting;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(15),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: AutoSizeText(_posting.type,
          maxLines: 2,
          maxFontSize: 20,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
      ),
      trailing: AspectRatio(
        aspectRatio: 3/2,
        child: Image(
          image: _posting.displayImages.first,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

}
class CreateAdListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     height: MediaQuery.of(context).size.height/12,
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Icon(Icons.add_photo_alternate_outlined),
           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Text('Create a new ad',
             style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20.0,
             ),
             ),
           ),
         ],
       ),
     ),

   );
  }

}
class uploadSlipListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/12,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.upload_rounded),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Upload the Payment Slip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

}