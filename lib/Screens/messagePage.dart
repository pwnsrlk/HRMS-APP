


/*class MassagePage extends StatefulWidget {

  MassagePage({Key key}) : super(key: key);

  @override
  _MassagePageState createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {


  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      itemCount: 2,
        itemExtent: MediaQuery.of(context).size.height/7,
        itemBuilder:(context, index){
          return InkResponse(

              child: ConversationListTile(),
          onTap: (){
                Navigator.pushNamed(context, ConversationPage.routeName);
          },
          );
        }

    );
  }
}*/
