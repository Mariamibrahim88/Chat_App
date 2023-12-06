import 'package:flutter/material.dart';
import 'package:scholar_chat_app/model/messageModel.dart';

import '../const.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.message,
    super.key,
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          // height: 70,
          // width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: kgry),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({
    required this.message,
    super.key,
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          // height: 70,
          // width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: kpurple),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
