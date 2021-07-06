


/*class ConversationPage extends StatefulWidget {
  static final String routeName= '/ConversationPageRoute';
  ConversationPage({Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: AppBarText(text:'Kasun' ),
      ),

      body: Column(
        children: <Widget>[

          Expanded(
            child:  ListView.builder(
              itemCount: 3,
                itemBuilder: (context, index){
                  return MessageListTile();
                },
            ),
          ),
         Container(
         child: Row(
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[

             Container(
               width: MediaQuery.of(context).size.width *5/6,

               child: Padding(
                 padding: const EdgeInsets.fromLTRB(5,0,5,5),
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: 'Write a message',
                     contentPadding: EdgeInsets.all(20),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black),
                         borderRadius: BorderRadius.all(Radius.circular(15.0),)
                     ),

                   ),
                   minLines: 1,
                   maxLines: 5,
                   style: TextStyle(
                     fontSize: 20,
                   ),
                 ),
               ),
             ),
             Expanded(

               child: MaterialButton(onPressed: (){},
                 color: Colors.blueAccent.shade400,
                 height: MediaQuery.of(context).size.height/20,
                 minWidth: double.minPositive,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)
                 ),
               child: Text('Send'),
               ),
             ),
           ],
         ),
         ),
        ],
      ),

    );
  }
}*/
