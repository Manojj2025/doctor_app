import 'package:doctor_app/app/modules/patient/models/messages.dart';
import 'package:firebase_database/firebase_database.dart';

import '../message_dao.dart';
import 'message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';

class MessageListState extends State<MessageList> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      appBar: AppBar(
        title: const Text('doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getMessageList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _messageController,
                      onChanged: (text) => setState(() {}),
                      onSubmitted: (input) {
                        _sendMessage();
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter new message'),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(_canSendMessage()
                        ? CupertinoIcons.arrow_right_circle_fill
                        : CupertinoIcons.arrow_right_circle),
                    onPressed: () {
                      _sendMessage();
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_canSendMessage()) {
      final message = Message(_messageController.text, DateTime.now(),
          widget.sendID.toString(), widget.receiverID.toString());
      widget.messageDao.Messages(message);
      _messageController.clear();
      setState(() {});
    }
  }

  // void readData() {
  //   return widget.messageDao.chat.once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.messageDao.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value;
          print(json);
          // final message = Message.fromJson(json);
          return MessageWidget(json.toString(), DateTime.now());
        },
      ),
    );
  }

  bool _canSendMessage() => _messageController.text.length > 0;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}

class MessageList extends StatefulWidget {
  final String sendID;
  final String receiverID;

  MessageList({required this.sendID, required this.receiverID});

  final messageDao = MessageDao();

  @override
  MessageListState createState() => MessageListState();
}
