

import 'package:hrsmapp/models/messagingObjects.dart';
import 'package:hrsmapp/models/postingObjects.dart';
import 'package:hrsmapp/models/userObjects.dart';

class PracticeData{
  //user data
  static List <User> users=[];
  static List<Posting> postings=[];

  static populateFeild(){
    User user1 = User(
      name: "Kasun Bandara",
      imagePath: "assets/images/profile-picture.jpg",
      email: "123456788@gmail.com",
      mobileNumber: "0766800219",
      password: "12345",
      address: "Dehiwala , Colombo",
      location: "Western Province",

    );
    User user2 = User(
      name: "Mihin Bandara",
      imagePath: "assets/images/profile-picture.jpg",
      email: "abcdef@gmail.com",
      mobileNumber: "071234567",
      password: "adcdef",
      address: "nittambuwa,gampaha , ",
      location: "Western Province",

    );
    users.add(user1);
    users.add(user2);

    /*Conversation conversation= Conversation();
    Conversation().createConversation(user2.createContactFromUser(),[]);

    Message message1 = Message();
    message1.createMessage(user1.createContactFromUser(), "hi how r u", DateTime.now(),);

    Message message2 = Message();
    message2.createMessage(user2.createContactFromUser(), "I'm fine", DateTime.now(),);

    conversation.messages.add(message1);
    conversation.messages.add(message2);

    user1.conversations.add(conversation);*/

    Posting  posting1= Posting(
      type: "Two story House",
      price: 30000,
      description: "a quit, cozy place in the hart of the city. easy to get to where ever you want.",
      address: "Dehiwala, Colombo",
      location: "Western Province",
      bedRooms: 3,
      bathRooms: 2,

      landLord: user1.createContactFromUser(),
    );
    posting1.setImages(['assets/images/123.jpg','assets/images/1234.jpg']);

    Posting  posting2= Posting(
      type: "one story House",
      price: 20000,
      description: "a quit, cozy place in the hart of the city. easy to get to where ever you want.",
      address: "maharagama, Colombo",
      location: "Western Province",
      bedRooms: 4,
      bathRooms: 3,
      landLord: user2.createContactFromUser(),
    );
    posting2.setImages(['assets/images/1234.jpg','assets/images/123.jpg']);

   postings.add(posting1);
   postings.add(posting2);

   user1.myPosting.add(posting1);
   user2.myPosting.add(posting2);


  }


}