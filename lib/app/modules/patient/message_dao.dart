import 'package:doctor_app/app/constants/constants.dart';
import 'package:doctor_app/app/modules/patient/models/user.dart';
import 'package:firebase_database/firebase_database.dart';

import 'models/messages.dart';

class MessageDao {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref().child('Users');
  DatabaseReference chat = FirebaseDatabase.instance.ref().child('Chat');

  void saveMessage(User users) {
    _messagesRef.push().set(users.toJson());
  }

  // void Messages(Message message) {
  //   chat.set(

  //     {
  //     "${Constants.sendid.toString()}": {"message": message.toJson()},
  //     "${Constants.receivedid.toString()}": {"message": message.toJson()}
  //   });
  // }
  void Messages(Message message) {
    chat.set(message.toJson());
  }

  DatabaseReference getMessageQuery() {
    return chat;
  }

  getusersQuery() async {
    return _messagesRef;
  }
}
