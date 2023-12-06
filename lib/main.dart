import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/pages/Log_In.dart';
import 'package:scholar_chat_app/pages/chatPage.dart';
import 'package:scholar_chat_app/pages/onBourding.dart';
import 'package:scholar_chat_app/pages/register.dart';
import 'package:scholar_chat_app/pages/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash': (context) => splashh(),
        'OnBourding': (context) => OnBourding(),
        'LogIn': (context) => LogIn(),
        'Register': (context) => Register(),
        'ChatPage': (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
    );
  }
}
