import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class OnBourding extends StatefulWidget {
  const OnBourding({super.key});

  @override
  State<OnBourding> createState() => OnBourdingState();
}

Widget DotView() {
  return Builder(builder: ((context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < 3; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 6,
          width: i == pageIndex ? 20 : 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: i == pageIndex ? kgry : Colors.grey),
        ),
    ]);
  }));
}

PageController nextPage = PageController();
int pageIndex = 0;

class OnBourdingState extends State<OnBourding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            controller: nextPage,
            children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //SizedBox(height: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Group Chat-amico.png',
                    width: 300,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    ' Chat App',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    textAlign: TextAlign.center,
                    'Creating a secure connection for your conversations..',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      nextPage.animateToPage(1,
                          duration: Duration(microseconds: 700),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kpurple),
                      child: Center(
                          child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(height: 40),
                  DotView(),
                ],
              ),
            ),
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //SizedBox(height: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Social life-amico.png',
                    width: 300,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Chat App',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    textAlign: TextAlign.center,
                    'Helps u connect with friends and family in easy way..',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      nextPage.animateToPage(2,
                          duration: Duration(microseconds: 700),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kpurple),
                      child: Center(
                          child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(height: 40),
                  DotView(),
                ],
              ),
            ),
          ]),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            //SizedBox(height: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Messages-amico.png',
                    width: 300,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Chat App',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  const Text(
                    textAlign: TextAlign.center,
                    'Welcome to the Chat App, Let\'s get started..',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'LogIn');
                    },
                    child: Container(
                      height: 56,
                      width: 165,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kpurple),
                      child: Center(
                          child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(height: 40),
                  DotView(),
                ],
              ),
            ),
          ]),
        ]));
  }
}
