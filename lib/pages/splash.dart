import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/pages/onBourding.dart';

class splashh extends StatefulWidget {
  const splashh({super.key});

  @override
  State<splashh> createState() => _splashhState();
}

class _splashhState extends State<splashh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, 'OnBourding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: kgry,
        body: Container(
      child: Center(
        child: Text(
          'Chat App',
          style: TextStyle(
            fontSize: 64,
            fontFamily: 'Pacifico',
            color: kpurple,
          ),
        ),
      ),
    ));
  }
}
