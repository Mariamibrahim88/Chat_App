import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_app/const.dart';

import '../model/messageModel.dart';
import '../widgets/bubbles.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _controller = ScrollController();
  bool isLoading = false;

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email =
        ModalRoute.of(context)!.settings.arguments; //access email argument
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(ktime, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                //elevation: 0,
                centerTitle: true,
                backgroundColor: kpurple,
                title: Row(children: [
                  Image.asset(KLogo, width: 70),
                  //const SizedBox(width: 5),
                  const Text('Chat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          fontSize: 30)),
                ]),
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email
                            ? ChatBubble(message: messageList[index])
                            : ChatBubbleFriend(
                                message: messageList[index],
                              );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (data) {
                      messages.add({
                        kmessage: data,
                        ktime: DateTime.now(),
                        'id': email,
                      });
                      messageController.clear();
                      _controller.animateTo(
                        //_controller.position.maxScrollExtent,
                        0,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kgry),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: kgry),
                        ),
                        hintText: 'Type a message',
                        suffixIcon: IconButton(
                            onPressed: () {
                              String data = messageController.text;
                              if (data.isNotEmpty) {
                                messages.add({
                                  kmessage: data,
                                  ktime: DateTime.now(),
                                  'id': email,
                                });
                                messageController.clear();
                                _controller.animateTo(
                                  0,
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 500),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: kgry,
                            ))),
                  ),
                )
              ]),
            );
          } else {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Center(
                  child: Text(
                'Loading...',
                style: TextStyle(fontSize: 12, color: kgry),
              )),
            );
          }
        });
  }
}
